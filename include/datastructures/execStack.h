#pragma once
//A Header describing the stack

#include "datastructures/variable.h"

typedef struct execStack
{
	int top;
	variable** data;
}execStack;

//An execStack may overflow if the function called is fat enough.
//In that case consider rewriting your pseudocode or recompiling with a larger stack size
//(In constants.h)

//allows the pushing of null pointers to accomodate for 
void execStack_push(execStack* e, variable* v );

//stack underflow is only guarded by an assertion!
variable* execStack_pop(execStack* e);

variable* execStack_top(execStack* e);

//returns 0 if the stack is empty
// 1 otherwise
char execStack_isEmpty( execStack* e );

//currently unused
variable** execStack_multi_top(execStack* e, unsigned int amount);

execStack* execStack_create();

void execStack_destroy(execStack* e);

//calls variable_print on all variables inside the stack.
//used for debugging purposes
void execStack_print( execStack* e );
