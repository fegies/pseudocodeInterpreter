#pragma once

typedef struct variable
{
	unsigned int info;
	void* contents;
	unsigned short refcount;
} variable;

typedef struct varTreeNode varTreeNode;

struct varTreeNode
{
	char *name;
	varTreeNode* left;
	varTreeNode* rigth;
	variable* var;
};

//This is the global namespace Tree.
//All class definitions go in here.
//Because it is classes that fuck everything up.
//(Fucking OOP)
varTreeNode *globalTree;

//only loocks in the local tree.
//classes are not returned by this method.
//if the name is not found within the tree, a new variable is created.
variable* lookupVar(varTreeNode* vtn,char* name);

//looks up an entry in the global tree.
//This us used when accassing function and class definitions.
variable* lookupGlobal(char *name);

//Walks through the tree and increments all references inside the code.
void incrementRefs(varTreeNode* vtn);

//decrements the reference count of all variables inside the tree.
//when the reference count of a node reaches 0 the variable it points to is freed
//and the pointer set to 0.
//For performance reasons the will NOT be unlinked.
void decrementRefs(varTreeNode* vtn);

//Frees the memory occupied by the variable
//Also decrements the reference counts of all further variables
//eventually referenced by the variable (in the case of Objects and arrays.)
//This can be a nasty nasty thing in the case of objects(linked lists, etc)
//And even worse in the case of arrays of objects
//Reall, OOP fucking everything up again
void freeVar(variable* v);
