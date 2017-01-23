#pragma once

#include "datastructures/class.h"
#include "datastructures/variable.h"


typedef struct object
{
	variable* prototype;
	variable** entries;
}object;

//the variables must match the definiton in the class provided.
variable* object_initialize( variable* prototype, variable** entries );

//name must be a string type variable
variable* object_member_access( variable* object, variable* name );

void object_destroy( object* o );
