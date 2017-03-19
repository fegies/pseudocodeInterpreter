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

Instruction* _instrAt( Instruction** instrarr, size_t pos )
{
	return instrarr[pos/INSTRBUFSIZE]+(pos%INSTRBUFSIZE);
}



Instruction* loadBytecode( char* bytes, size_t inputlength )
{
	globalVariables = nameStore_create();

	preloadLibraryFunctions();

	size_t instpos = 0;
	size_t instarrnum = 0;
	size_t bytepos = 0;

	//to facilitate allocating more space later without resorting to realloc()
	//the instructions are not acessed directly, but through the use of the
	//helper function _instrAt.
	Instruction** instrarr;

	if(( instrarr = malloc( sizeof(Instruction*) * INSTRBUFSIZE ) ) == 0
		|| ((instrarr[0] = malloc( sizeof(Instruction) * INSTRBUFSIZE )) == 0 ) )
	{
		fprintf(stderr, "Failed to allocate memory for instructions\n");
		exit(1);
	}


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
			default:
			{
				if( type <= 32 )
					break;
				printf("Code error: invalid type: %d\n", type);
				exit(1);
			}

		}
		curins-> additionalData = additionalData;

		//alloc more memory if needed.
		if( instpos % INSTRBUFSIZE == 0 )
		{
			if(++instarrnum == INSTRBUFSIZE)
			{
				fprintf(stderr, "Ran out of Instruction space.. %d Instructions\n\
					Recompile with a larger INSTRBUFSIZE at constants.h",
					INSTRBUFSIZE * INSTRBUFSIZE );
				exit(1);
			}
			if((instrarr[instarrnum] = malloc( sizeof(Instruction)* INSTRBUFSIZE)) == 0)
			{
				fprintf(stderr, "Failed to allocate memory for instructions\n");
				exit(1);
			}
		}

	}

	#ifndef NINSPRINT
	printf("Finished Loading the code.. Layout:\n");
	for( int i = 0; i < instpos; ++i )
		printInstruction( _instrAt(instrarr, i ) );
	#endif

	Instruction * e = *instrarr;
	free( instrarr );
	return e;
}
