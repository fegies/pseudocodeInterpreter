#pragma once

#include "datastructures/variable.h"

char boolean_isTrue( variable* bool );

variable* boolean_and( variable* v1, variable* v2 );

variable* boolean_or( variable* v1, variable* v2 );

variable* boolean_not( variable* v1 );

variable* boolean_xor( variable* v1, variable* v2 );
