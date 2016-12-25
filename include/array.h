#pragma once
//A header describing array functionality

#include "variable.h"

typedef struct array array;

struct array
{
	variable** data;
	struct array* nextSegment;
};

array* array_new();

//handles the refcount accordingly.
void array_put(array* a, unsigned int position, variable* v);

//if there is no var at the position, creates a new, undefined one
variable* array_get(array* a, unsigned int position);

//decrements the refcount of all vars in it and calls free();
void array_destroy(array* a);
