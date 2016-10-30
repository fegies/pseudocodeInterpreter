#pragma once

#include <stdio.h>

#include "variable.h"
#include "localVariableContainer.h"
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
*/
struct block
{
	char type;
	char* instruction;
	int instructionLength;
	struct block* nextBlockTrue;
	struct block* nextBlockFalse;
};

struct block* buildBlocks()
