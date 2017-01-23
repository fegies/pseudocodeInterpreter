#pragma once

#include "instruction.h"
#include "datastructures/variable.h"
#include "datastructures/nameStore.h"

void interpretPSC( Instruction* entry );


//interprets a function until a return statement is reached.
variable* interpretFunction( Instruction* entry, nameStore* args );

