#pragma once

#include "variable.h"

/*
This header defines functions that can be performed on the variables of the language
*/

/*
All operations set the type of the result to 0 if they could not correctly 
*/

//Integer operations
//They do not accept any null pointers.
//If they find a null pointer, they will just terminate.
void addInt(variable* result, variable* v1, variable* v2);
void subtractInt(variable* result, variable* v1, variable* v2);
void multiplyInt(variable* result, variable* v1, variable* v2);
void divideInt(variable* result, variable* v1, variable* v2);

//"creates" a reference if used on objects or arrays.
//classes and functions cannot be copied.
void assignValue(variable* to, variable* from);

/*
compares the two variables.
Return values:
-1 if the first variable is smaller than the second
0 if the variables have equal values
1 if the first variable is larger than the second
2 if the values are not equal but no order is determinable
(used for references and the like)
*/
int compareVars(variable* first, variable* second);
