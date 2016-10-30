#include "interpreter.h"
#include "constants.h"
#include "variable.h"

#include <string.h>
#include <stdlib.h>
#include <stdio.h>


void interpretFile(FILE* input)
{

	char* buffer = calloc(SCRIPTBUFFERSIZE, sizeof(char) );

	if( buffer == 0 )
	{
		fprintf(stderr,"could not reserve memory: %d bytes\n", SCRIPTBUFFERSIZE);
		exit(1);
	}

	unsigned int reads = fread( buffer, sizeof(char), SCRIPTBUFFERSIZE, input);

	if( reads >= SCRIPTBUFFERSIZE-1 )
	{
		fprintf(stderr, "Read Script size larger than buffer of %d bytes\n", SCRIPTBUFFERSIZE);
		exit(1);
	}

	variable* rootreturnval = 0;

	localVariableContainer rootstack;
	memset( &rootstack, 0, sizeof(localVariableContainer) );

	interpretFunction(buffer,&rootreturnval, &rootstack);

	destroyLVC(&rootstack);
	free(buffer);
}

void interpretFunction(char* beginning, variable** returnValue,
	localVariableContainer* lvc)
{

	//These save information of how deep the program is in loops
	int currentLoopDepth = -1;
	//The position of the loop test
	char* loopConditionStack [MAXLOOPDEPTH];
	//The position of the first instruction in the loop
	char* loopEntyStack [MAXLOOPDEPTH];

	char* statementBegin = beginning;
	char* statementEnd = 0;

	char statementType;

	char lastIfState;

	/*
		Skip all Instructions until a specific statement is ecountered.
		Values:
		1: else, or elseif, or fi (Used when if evaluates to false)
	*/
	char SkipUntil = 0;

	while ( 1 )
	{
		type = analyseStatement(statementBegin, &statementEnd);

		//Statement is relevant for control flow
		if(type > 100)
			switch( statementType )
			{
				case 101: //if
					if( testCondition(statementBegin, lvc) )
						lastIfState = 1;
					else
					{
						lastIfState = 0;
						statementBegin = seekBlockEnd(1,statementEnd+1);
					}
					break;
				case 102: //else
			}
		//regular statement
		else if( statementType != 0 )
			executeStatement(statementType,statementBegin,lvc,returnValue);

		//Null character or } -> end of function.
		if( *statementEnd == 0 || *statementEnd == '}')
			return;
		//Just go on to the next statement.
		else
			statementBegin = statementEnd + 1;
	}
}
