#pragma once

#include "variable.h"

//the return value is accessed by passing in a null char as the name.

typedef struct localVariableContainer localVariableContainer;

struct localVariableContainer
{
	char* name;
	variable* variable;
	localVariableContainer* left;
	localVariableContainer* right;
};

//The variable container containing the functions and classes and stuff has to
//be global.
//I'm not even going to bother with memory management there
localVariableContainer globalVars;

//looks up the variable.
//must return a valid variable.
//if it is a new name, it create a new variable.
variable* LVClookupVar(localVariableContainer* lvc,char* name);

//stores the variable in the tree.
//increments the reference count of the variable in question.
//if there is already a variable with the same name in the tree,
//the old reference must be rewritten to point to the new var, and the refcount
//decremented accordingly
void LVCstoreVar(localVariableContainer* lvc, variable* var, char* name);

//Increments the reference count of variables in the tree.
void enterBlockLVC(localVariableContainer* lvc);

//decrements the reference count of variables in the tree
void leaveBlockLVC(localVariableContainer* lvc);

//Destroys the container. decrements references of variables in there.
//Frees all possible memory.
void destroyLVC(localVariableContainer* lvc);


//These are just like the local variants, only they have a global lookup tree
variable* LVCglobalLookup( char* name );
void LVCglobalStore( variable* var, char* name );
