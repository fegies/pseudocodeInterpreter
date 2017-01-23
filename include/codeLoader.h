#pragma once

//Deserializes the code from the byte array to an executable graph of nodes.
#include "instruction.h"
#include <stdio.h>

//loads the bytecode after the function and class definitions have run through
Instruction* loadBytecode( char* bytes, size_t inputLength );

struct function_Data
{
	Instruction* functionEntrypoint;
	size_t argcount;
	char** argnames;
};

struct classData
{
	size_t membercount;
	char** membernames;
};
