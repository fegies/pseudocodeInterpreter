#pragma once

#include "instruction.h"
#include "datastructures/variable.h"
#include "datastructures/nameStore.h"

void interpretPSC( Instruction* entry );


//interprets a function until a return statement is reached.
//if the stack is empty when the return statement is reached, returns a null pointer.
variable* interpretFunction( Instruction* entry, nameStore* args );

