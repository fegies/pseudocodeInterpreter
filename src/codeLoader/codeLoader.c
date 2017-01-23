#include "codeLoader.h"

#include "constants.h"
#include "codeLoader/byteops.h"
#include <stdio.h>
#include <string.h>
#include <arpa/inet.h>
#include <stdlib.h>

Instruction* _instrAt( Instruction** instrarr, size_t pos )
{
	return instrarr[pos/INSTRBUFSIZE]+(pos%INSTRBUFSIZE);
}


Instruction* loadBytecode( char* bytes, size_t inputlength )
{
	size_t instpos = 0;
	size_t instarrnum = 0;
	size_t bytepos = 0;

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
				
			}
			case InstrType_ClassDecl:

			case InstrType_VarLookup:
			case InstrType_GlobalLookup:
			case InstrType_PushConstStr:
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

	return *instrarr;
}
