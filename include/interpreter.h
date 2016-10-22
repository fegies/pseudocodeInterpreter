#pragma once

#include <stdio.h>


/*
Every function has to have its own variable tree.
Upon entering and leaving a block, the variable references must be incremented,
or decremented accordingly.
*/

//The main function call. Prepares the proper environment for the function to run..
void interpretFile(FILE* input);


//Takes the beginning of the code containing the function up to either a return statement
//or the end of the funcion ( delimited by } or EOF )
//Void functions or returns without a value may set the return value to 0.
void interpretFunction(variable** returnValue, char* FunctionBegin);

