#pragma once
//A Header describing the stack

#include "datastructures/variable.h"

typedef struct execStack
{
	int top;
	variable** data;
}execStack;


void execStack_push(execStack* e, variable* v );

variable* execStack_pop(execStack* e);

variable* execStack_top(execStack* e);

char execStack_isEmpty( execStack* e );

variable** execStack_multi_top(execStack* e, unsigned int amount);

execStack* execStack_create();

void execStack_destroy(execStack* e);

void execStack_print( execStack* e );
