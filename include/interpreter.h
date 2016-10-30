#pragma once

#include <stdio.h>

#include "variable.h"
#include "localVariableContainer.h"
/*
This header defines the interpretation functions called by the main function.
*/
void interpretFile(FILE* input);

//Interprets till it reaches null character or a closing bracket (})
void interpretFunction(char* beginning, variable** returnValue, 
	localVariableContainer* lvc);

/*returns the type of statement.
sets end to the statement delimiter(can be \n or \0 )
Valid return value are:
0: there is no statement (whitespace. This statement can be skipped.)
Everything above 100 are control flow relevant statements.

101: if
102: else
103: elseif
104: fi
*/
char analyseStatement(char* beginning,char** end);

//returns 1 if the condition evaluated to true, 0 otherwise.
//Able to test loop conditions and if and the like
char testCondition(char* position, localVariableContainer* lvc);

//executes the given statement.
//the returnValue variable has to be handed over because return
//is also a statement that can be interpreted.
void executeStatement(char type, char* beginning, localVariableContainer* lvc,
	variable** returnValue);

/*
returns the position of the end of the block
(the first char of the ending statement)
type values:
1: a then-block 
*/
char* seekBlockEnd(char type, char* beginning);
