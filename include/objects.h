#pragma once

#include "variable.h"

struct classEntry
{
	char type;
	char* entryName;
};

typedef struct classPrototype
{
	unsigned char entryCount;
	//one or more classEntry 's
} classPrototype;

struct objectEntry
{
	char* entryName;
	variable* value;
};

typedef struct object
{
	unsigned char entryCount;
	classPrototype* prototype;
	//ome or more objectEntry 's
} object;

//These return the size of the class definition
//or the object instance 
int classSizeof(classPrototype *c);
int objectSizeof(object *o);

//This function returns the member being accessed.
//or 0 if the object does not exist or contain a member of that name
variable* accessObjectMember(object *o, char* name);

//This function creates a new object.
//All values inside the object are set to 0
//returns 0 if not enough memory could be allocated
//or the class is invalid.
object* instanciateObject(classPrototype *c);

//called when the last reference to this object is invalidated.
//frees the memory occupied by this object and sets its type to 0
//to  invalidate further access to it
//decrements the refcount of any objects referenced by this object.
void destroyObject(object* o);
