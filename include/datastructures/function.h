#pragma once

#include "instruction.h"
#include "datastructures/variable.h"

typedef struct variableFunction{
	Instruction* entrypoint;
	struct multistring_args args;
}variableFunction;

//copys all the information inside ars into mewly allocated memory, so it is
//fine to free the pointer after calling this
variable* variableFunction_new( Instruction* entrypoint,
	struct multistring_args* args);

void variableFunction_destroy( variableFunction* v );
