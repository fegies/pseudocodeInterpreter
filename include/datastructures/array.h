#pragma once
//A header describing array functionality

#include "datastructures/variable.h"

typedef struct array array;

struct array
{
	variable** data;
	array* nextSegment;
};

variable* array_new();

//BOTH array_put and array_get may increase the memory footprint substancially if
//a very high position is accessed.
// TLDR: sparse arrays are inefficient.

//handles the refcount accordingly.
void array_put(variable* array, unsigned int position, variable* v);

//if there is no var at the position, creates a new, undefined one
variable* array_get(variable* array, unsigned int position);

//decrements the refcount of all vars in it and calls free();
void array_destroy(array* a);
