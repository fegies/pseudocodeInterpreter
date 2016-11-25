#include "interpreter.h"
#include "constants.h"
#include "variable.h"

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "statement.h"
#include "localVariableContainer.h"
#include "array.h"
#include "object.h"
#include "numeric.h"

void interpretFile(FILE* input)
{

	char* buffer = calloc(SCRIPTBUFFERSIZE, sizeof(char) );

	if( buffer == 0 )
	{
		fprintf(stderr,"could not reserve memory: %d bytes\n", SCRIPTBUFFERSIZE);
		exit(1);
	}

	if( fread( buffer, sizeof(char), SCRIPTBUFFERSIZE, input) 
		>=
		 SCRIPTBUFFERSIZE-1 )
	{
		fprintf(stderr, "Read Script size larger than buffer of %d bytes\n",
			SCRIPTBUFFERSIZE);
		exit(1);
	}

	statement* entryStatement = buildStructure(buffer, strlen(buffer));

	interpretStructure(entryStatement);

	free(buffer);
}

variable* localStackAccess(char mode, variable* v)
{
	static char isFirstCall = 1;
	static int stacktop = 0;
	static variable** stack;

	if( isFirstCall )
	{
		stack = malloc( EXECUTIONSTACKSIZE * sizeof(variable*) );
		isFirstCall = 0;
	}

	if( mode == 0 )
		stack[ stacktop++ ] = v;
	else if( mode == 1 )
		return stack[ stacktop-- ];
	return (variable*) 0;
	switch( mode )
	{
		case 0:
			stack[ stacktop++ ] = v;
			break;
		case 1:
			return stack[ stacktop-- ];
		case 2:
			return stack[ stacktop ];
	}
}

//returns void
#define localStackPush(v) (localStackAccess( 0, v ));

//These return a variable*
#define localStackPop() ( localStackAccess( 1, (variable*) 0 ) )
#define localStackTop() ( localStackAccess( 2, (variable*) 0 ) ) //returns top event without popping


void interpretStructure(statement* entryPoint)
{
	localVariableContainer lvc;
	memset( &lvc, 0, sizeof(localVariableContainer) );

	statement* curst = entryPoint;

	while ( 1 )
	{
		switch( curst -> type )
		{
			case 0: // NOP
				break;
			case 1: // IF
				curst = ((variableBoolean*)(localStackPop() -> variabledata)) == 0 ?
					curst -> next : ((statementCondition*) curst) -> nextFalse;
				continue;
			case 2: // LVCLookup
				localStackPush( LVClookupVar(&lvc, ((statementLVCLookup*)curst) -> name ) );
				break;
			case 3: // LVCStore
				LVCstoreVar( &lvc, localStackPop(), ((statementLVCStore*)curst) -> name );
				break;
			case 4:	// Array Access
				localStackPush( arrayAccess( (variableArray*)localStackPop(),
				((statementArrayAccess*)curst)-> index) );
				break;
			case 5: // Object member access
				localStackPush( objectMemberAccess( 
					(variableObject*) localStackPop(),
					((statementObjectMemberAccess*)curst)-> name ) );
				break;
			case 6: // Object initialization
			{
				variable* class = localStackPop();
				localStackPush( objectInitialize( (variableClass*)class ) );
			}
				break;
			case 7:
				localStackPush( LVCglobalLookup( ((statementGlobalLookup*)curst)-> name ) );
				break;
			case 8:
				LVCglobalStore( localStackPop(), ((statementGlobalStore*)curst)-> name );
				break;
			case 10: // variable assignment
			{
				variable* tv = localStackPop();
				variableAssign( localStackTop(), tv );
			}
				break;
			case 11: // addition
			case 12: // subtraction
			case 13: // multiplication
			case 14: // division
			{
				variable* top = localStackPop();
				variable* bot = localStackPop();
				switch( curst -> type )
				{
					case 11:
						localStackPush( variableNumericAdd( top, bot ) ); break;
					case 12:
						localStackPush( variableNumericSubtract( top, bot ) ); break;
					case 13:
						localStackPush( variableNumericMultiply( top, bot ) ); break;
					case 14:
						localStackPush( variableNumericDivide( top, bot ) ); break;
				}
			}
				break;
			case 30: //println
				break;
			case 40: //program termination
				return;
			default:
				fprintf(stderr, "Failed to execute node...(Compile error, maybe?)\n");
				exit(1);
		}
		curst = curst -> next;
	}
}

