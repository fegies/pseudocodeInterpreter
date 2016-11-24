#pragma once

/*
This header defines all that has to do with variables.
*/

typedef struct variable
{
	char type;
	int refcount;
	void* data;
}variable;

/* values for type:
0: invalid type
1: boolean
*/


//decrements the reference count of this variable.
//Frees memory if applicable.
//returns 1 if the variable was freed.
//returns 0 otherwise.
char variable_decrementRefs(variable* v);

//does nothing more than just freeing some memory.
void variable_incrementRefs(variable* v);

//assingns the value of v2 to v1
//does not change the reference counters
void variableAssign(variable* v1, variable* v2);

//these functions return a new variable containing the result of the operation.
variable* variableNumericAdd(variable* v1, variable* v2);
variable* variableNumericSubtract(variable* v1, variable* v2);
variable* variableNumericMultiply(variable* v1, variable* v2);
variable* varialbeNumericDivide(variable* v1, variable* v2);