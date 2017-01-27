#pragma once

/*
	Generalized Operations
	They resolve to specific operations depending on the result of the argument
	types
*/

#include "datastructures/variable.h"

//resolves to integer or float addition or string concatenation
variable* operation_add(variable* v1, variable* v2);

//return the value of the variable
//does not change the references
long integer_get( variable* v );

//changes to to be a refercence to from.
//references are resolved.
//if to contained data, it is free'd accordingly.
void operation_assign( variable* to, variable* from );

//these resolve to integer or float subtraction
//they all return a new variable containing the result of the operation
variable* operation_subtract( variable* v1, variable* v2 );
variable* operation_multiply( variable* v1, variable* v2 );
variable* operation_divide( variable* v1, variable* v2 );
variable* operation_modulo( variable* v1, variable* v2 );

variable* operation_compareEq( variable* v1, variable* v2 );
variable* operation_compareLt( variable* v1, variable* v2 );
variable* operation_compareGt( variable* v1, variable* v2 );
variable* operation_compareLeq( variable* v1, variable* v2 );
variable* operation_compareGeq( variable* v1, variable* v2 );


//these are operating on the variable itself
void operation_inc( variable* v );
void operation_dec( variable* v );
