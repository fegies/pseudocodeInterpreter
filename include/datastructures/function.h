#pragma once

#include "instruction.h"
#include "datastructures/variable.h"

typedef struct variableFunction{
	Instruction* entrypoint;
	struct multistring_args args;
}variableFunction;


variable* variableFunction_new( Instruction* entrypoint,
	struct multistring_args* args);

void variableFunction_destroy( variableFunction* v );
