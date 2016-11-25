#pragma once

/*
This header defines objects and the functions that deal with them.
*/

#include "variable.h"


variable* objectMemberAccess( variableObject* object, char* memberName );

variableObject* objectInitialize( variableClass* class );
