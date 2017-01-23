#pragma once

#include "datastructures/variable.h"
#include "instruction.h"
#include <stdlib.h>

typedef struct class
{
	size_t entrycount;
	variable** names;
}class;

variable* class_new( struct multistring_args* args );

void class_destroy(class* c);
