#pragma once

#include "variable.h"

typedef struct localVariableContainer
{
	
} localVariableContainer;

//looks up the variable.
//must return a valid variable.
//if it is a new name, it create a new variable.
variable* lookupVar(localVariableContainer* es,char* name);

//stores the variable in the tree.
//increments the reference count of the variable in question.
//if there is already a variable with the same name in the tree,
//the old reference must be rewritten to point to the new var, and the refcount
//decremented accordingly
void store(variable* var, char* name);

//Increments the reference count of variables in the tree.
void enterBlockLVC(localVariableContainer* es);

//decrements the reference count of variables in the tree
void leaveBlockLVC(localVariableContainer* es);

//Destroys the container. decrements references of variables in there.
//Frees all possible memory.
void destroyLVC(localVariableContainer* es);
