#pragma once

/*
This header defines all that has to do with variables.
*/

typedef struct variable
{
	int refcount;
}variable;

//decrements the reference count of this variable.
//Frees memory if applicable.
//returns 1 if the variable was freed.
//returns 0 otherwise.
char variable_decrementRefs(variable* v);

//does nothing more than just freeing some memory.
void variable_incrementRefs(variable* v);