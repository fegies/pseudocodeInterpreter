#pragma once

typedef struct variable
{
	unsigned char type;
	void* contents;
	unsigned short refcount;
} variable;

typedef struct varTreeNode varTreeNode;

struct varTreeNode
{
	char *name;
	varTreeNode* left;
	varTreeNode* right;
	variable var;
};

//This is the global namespace Tree.
//All class definitions go in here.
//Because it is classes that fuck everything up.
//(Fucking OOP)
varTreeNode *globalTree;

//only looks in the local tree.
//classes are not returned by this method.
//if the name is not found within the tree, a new variable is created.
//it is undefined at the moment of creation.
//Double pointers are required because accessing an empty tree creates a
//new root node.
variable* lookupVar(varTreeNode** vtn,char* name);

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

/*
Looks at the variable and frees the memory that might be referenced by the
variable given.
Does not actually call free() on the variable pointer itself.
That task must be done by the code calling freeVarRefs().
Sets the type of the variable to 0.
*/
void freeVarRefs(variable* v);
