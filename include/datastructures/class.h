#pragma once

#include "datastructures/variable.h"

struct class_entry
{
	char vartype;
	variable* name; //A string variable
};

typedef struct class
{
	unsigned char entrycount;
	struct class_entry* entries;
}class;

variable* class_new(unsigned char entryconut, struct class_entry* entries);

void class_destroy(class* c);
