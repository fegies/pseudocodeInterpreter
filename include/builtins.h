#pragma once

/*
This header defines language builtin functions like
print()
printf()
*/

#include "variable.h"


//Prints out text representation of a variable.
//Only works on integers and strings.
//If attempted to be used on objects it will print nothing.
void print(variable* v);


//This is a severely limitey printf. it only accepts a singly argument
void printf(variable* formatString, variable* argument);