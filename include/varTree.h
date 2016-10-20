#pragma once

typedef struct variable
{
	unsigned int info;
	void *contents;
	unsigned short refcount;
} variable;

typedef struct varTreeNode varTreeNode;

struct varTreeNode
{
	char *name;
	varTreeNode *left;
	varTreeNode *right;
	variable *var;
};

//Fetches the variable specified by the specific name from the tree.
//Returns 0 if no variable of that type exists or the variable is undefined.
variable *getVariable(varTreeNode* root, char* name);

//assigns the value.
//in the case of an int copies the value.
//otherwise creates a new varTreeNode pointing to the same variable
//and increases the reference count.
//If a variable of the given name exists, the reference count of the variable
//it points to is decremented and the node overwritten.
//returns 0 on success, 1 otherwise.
char assignValue(varTreeNode* root, char* name, variable* value);


//called when entering a subblock.
//Walks through the variables tree and incremants all the reference counts in there.
void incrementReferences(varTreeNode* root);

//called when exiting a subblock.
//Decrements all reference counts within the word tree.
//Should the number of references of a variable reach 0, its memory is freed
//and the variable removed from the tree
void decrementReferences(varTreeNode* root);