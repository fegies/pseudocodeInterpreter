#pragma once

#include <stdio.h>

#include "variable.h"
#include "localVariableContainer.h"
#include "constants.h"
/*
This header defines the interpretation functions called by the main function.
It does so by first creating a Tree of blocks with statements and subblocks.
*/
void interpretFile(FILE* input);

//Interprets till it reaches null character or a closing bracket (})

/*
The type can take the following values:
0: just a normal instruction
1: conditional execution
2: function call
3: function return
4: blockEnter (increment local References)
5: blockLeave (decrement local References)
*/
typedef struct statement
{
	char type;
	char* instruction;
	int instructionLength;
	struct statement* nextBlockTrue;
	struct statement* nextBlockFalse;
} statement;

typedef struct callstackEntry
{
	statement* returnPoint;
	localVariableContainer vars;
} callstackEntry;

callstackEntry callstack [MAXDEPTH];
int currentDepth = 0;

statement* buildStructure(char* beginnning, int length);

void interpretCode(statement* entryPoint);
