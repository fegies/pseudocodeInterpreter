#pragma once

//Deserializes the code from the byte array to an executable graph of nodes.
#include "instruction.h"
#include <stdio.h>

//loads the bytecode and adds class and function declarations to the
//global namestore.
//returns the entry point to the program.
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

//frees the memory allocated during code loading
void unloadBytecode();

//loads the file specified by the path
void loadFile( char* path );
