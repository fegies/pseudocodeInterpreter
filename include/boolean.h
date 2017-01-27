#pragma once

#include "datastructures/variable.h"

//Some boolean Operations

char boolean_isTrue( variable* bool );

//this changes the value of v
void boolean_not( variable* v );

//These return a new variable
variable* boolean_and( variable* v1, variable* v2 );
variable* boolean_or( variable* v1, variable* v2 );
variable* boolean_xor( variable* v1, variable* v2 );
