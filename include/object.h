#pragma once

/*
This header defines objects and the functions that deal with them.
*/

#include "variable.h"

struct objectEntry{
	char* name;
	variable* var;
};

typedef struct objectData{
	unsigned char entrycount;
	struct objectEntry* entries;
} objectData;

typedef struct classData{
	unsigned char entrycount;
	char** names;
} classData;

variable* objectMemberAccess( variableObject* object, char* memberName );

variableObject* objectInitialize( variableClass* class );

void objectDestroy( variableObject* object );
