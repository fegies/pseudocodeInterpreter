#pragma once

/*
	Generalized Operations
	They resolve to specific operations depending on the result of the argument
	types
*/

#include "datastructures/variable.h"

//resolves to integer or float addition or string concatenation
variable* operation_add(variable* v1, variable* v2);

//resolves to integer or float subtraction
variable* operation_subtract( variable* v1, variable* v2 );

variable* operation_multiply( variable* v1, variable* v2 );

variable* operation_divide( variable* v1, variable* v2 );

variable* operation_modulo( variable* v1, variable* v2 );

long integer_get( variable* v );

void operation_assign( variable* to, variable* from );


variable* operation_compareEq( variable* v1, variable* v2 );
variable* operation_compareLt( variable* v1, variable* v2 );
variable* operation_compareGt( variable* v1, variable* v2 );
variable* operation_compareLeq( variable* v1, variable* v2 );
variable* operation_compareGeq( variable* v1, variable* v2 );

void operation_inc( variable* v );
void operation_dec( variable* v );
