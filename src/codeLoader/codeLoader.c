#include "codeLoader/codeLoader.h"

#include "constants.h"
#include "codeLoader/byteops.h"
#include "datastructures/function.h"
#include "datastructures/class.h"
#include "codeLoader/standartLibrary.h"
#include "globals.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define _instrAt( instrarr, pos ) (instrarr + pos)

size_t countInstructions( char* bytes, size_t inputlength )
{
	size_t instrcount = 0;
	for( size_t i = 0; i < inputlength; ++i, ++instrcount )
	{
		switch( bytes[i] )
		{
			//these have an int as additional data.
			case InstrType_Jump:
			case InstrType_ConditionalJump:
			case InstrType_PushConstInt:
			{
				i += 4;
				break;
			}
			//these take just a single string
			case InstrType_VarLookup:
			case InstrType_GlobalLookup:
			case InstrType_PushConstStr:
			case InstrType_ObjNew:
			case InstrType_Load:
			{
				++i;
				i += strnlen(bytes + i, inputlength - i);
				break;
			}
			case InstrType_FunctionDecl:
			case InstrType_ClassDecl:
			{
				char type = bytes[i];

				++i;
				while( i < inputlength && bytes[i] != 0 )
					i += strnlen(bytes + i, inputlength - i) + 1;

				if( type == InstrType_FunctionDecl )
					i += 4;

				break;
			}
		}
	}
	return instrcount;
}

Instruction* loadedInstrs[256];
unsigned char instructionSetsLoaded = 0;
Instruction* loadBytecode( char* bytes, size_t inputlength )
{

	static char libLoaded = 0;
	if( !libLoaded )
	{
		globalVariables = nameStore_create();
		libLoaded = 1;
		preloadLibraryFunctions();
	}

	size_t instpos = 0;
	size_t bytepos = 0;

	size_t instnum = countInstructions( bytes, inputlength );
	Instruction* instrarr = malloc( sizeof(Instruction) * instnum);

	if( instrarr == 0 )
	{
		fprintf(stderr, "Failed to allocate memory for instructions\n");
		exit(1);
	}

	loadedInstrs[instructionSetsLoaded++] = instrarr;

	while( bytepos < inputlength )
	{
		char type = bytes[bytepos++];

		Instruction* curins = _instrAt( instrarr, instpos++ );
		curins-> type = type;
		curins-> next = _instrAt( instrarr, instpos );
		void* additionalData = 0;

		switch( type )
		{
			case InstrType_Jump:
			case InstrType_ConditionalJump:
			{
				int32_t jpos = bytesToInt( bytes+bytepos );
				bytepos += 4;
				additionalData = _instrAt( instrarr, instpos + jpos );
				break;
			}
			case InstrType_FunctionDecl:
			{
				struct multistring_args* args;
				char* name = 0;
				bytepos += stringlitcpy( &name, bytes+bytepos );
				bytepos += getMultiargs( &args, bytes+bytepos );

				int32_t jpos = bytesToInt( bytes+bytepos );
				bytepos += 4;
				additionalData = _instrAt( instrarr, instpos + jpos );
				curins -> type = InstrType_Jump;

				variable* v = variableFunction_new( _instrAt( instrarr, instpos),
					args );

				nameStore_put( globalVariables, name, v );

				break;
			}
			case InstrType_ClassDecl:
			{
				struct multistring_args* args;
				char* name = 0;
				bytepos += stringlitcpy( &name, bytes+bytepos );
				bytepos += getMultiargs( &args, bytes+bytepos );

				curins -> type = 0;

				variable* v = class_new( args );

				nameStore_put( globalVariables, name, v );

				free( args );
				break;
			}

			case InstrType_VarLookup:
			case InstrType_GlobalLookup:
			case InstrType_PushConstStr:
			case InstrType_ObjNew:
			{
				char * b; 
				bytepos += stringlitcpy( &b, bytes+bytepos );
				additionalData = b;
				break;
			}
			case InstrType_PushConstInt:
			{
				int32_t i = bytesToInt( bytes+bytepos );
				bytepos += 4;
				additionalData = (void*)(long)i;
				break;
			}
			case InstrType_Load:
			{
				char* filename;
				bytepos += stringlitcpy( &filename, bytes+bytepos );
				loadFile( filename );
				curins-> type = InstrType_NOP;
				break;
			}
			default:
			{
				if( type <= 33 )
					break;
				fprintf(stderr, "Code error: invalid type: %d\n", type);
				exit(1);
			}

		}
		curins-> additionalData = additionalData;
	}

	#ifndef NINSPRINT
	printf("Finished Loading the code.. Layout:\n");
	for( int i = 0; i < instpos; ++i )
		printInstruction( _instrAt(instrarr, i ) );
	#endif

	return instrarr;
}

char* loadedFiles[256];
unsigned char loadedFilenum = 0;
void loadFile( char* filename )
{

	if( loadedFilenum + 1 == 0 )
		fprintf(stderr, "Warning: checking of double file load damaged, too many files loaded\n");
	for( unsigned char i = 0; i < loadedFilenum; ++i )
	{
		if( strcmp(filename, loadedFiles[i]) == 0 )
			return;
	}
	loadedFiles[loadedFilenum++] = filename;

	FILE* f = fopen( filename,"rb");

	if( f == 0 )
	{
		fprintf(stderr, "Could not read file: %s\n", filename);
		exit(1);
	}

	char* bytes=0;

	if( (bytes = malloc ( READ_BUF_SIZE )) == 0 )
	{
		fprintf(stderr, "Buffer allocation failed\n");
		exit(1);
	}

	size_t length = 0;

	while (!feof(f))
	{
		size_t readbytes = fread( bytes+length , sizeof(char), READ_BUF_SIZE, f);
		length += readbytes;

		if( readbytes == READ_BUF_SIZE )
		{
			size_t news = sizeof(char) * (length + READ_BUF_SIZE);
			printf("realloc with size: %ld\n", news);
			char* newbuf = realloc( bytes, news );
			if( newbuf == 0 )
			{
				fprintf(stderr, "realloc of input buffer failed. Exiting\n");
				exit(1);
			}
			bytes = newbuf;
		}
	}

	loadBytecode( bytes, length );

	free( bytes );
}

void unloadBytecode()
{
	for( unsigned char i = 0; i < instructionSetsLoaded; ++i )
		free( loadedInstrs[i] );

	nameStore_destroy( globalVariables );
}
