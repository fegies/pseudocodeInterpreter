#pragma once

#include <stdio.h>

#include "variable.h"
#include "localVariableContainer.h"
#include "constants.h"
#include "compiler.h"
/*
This header defines the interpretation functions called by the main function.
It does so by first creating a Tree of blocks with statements and subblocks.
*/

//compiles the code contained in the file into a memory structure and then calls
//the interpreter on thàt structure.
void interpretFile(FILE* input);



void interpretStructure(statement* entryPoint);
