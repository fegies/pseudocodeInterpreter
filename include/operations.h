#pragma once

#include "variable.h"

/*
This header defines functions that can be performed on the variables of the language
*/

/*
All operations set the type of the result to 0 if they could not correctly 
*/

//Integer operations
void addInt(variable* result, variable* v1, variable* v2);
void subtractInt(variable* result, variable* v1, variable* v2);
void multiplyInt(variable* result, variable* v1, variable* v2);
void divideInt(variable* result, variable* v1, variable* v2);

//"creates" a reference if used on objects or arrays.
//classes and functions cannot be copied.
//
void assignValue(variable* to, variable* from);

int compare