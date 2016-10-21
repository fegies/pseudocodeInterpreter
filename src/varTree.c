#include "varTree.h"
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

variable* getVariable(varTreeNode* root,char* name)
{
	varTreeNode* node = root;
	int compres;
	while (node != 0)
	{
		compres = strcmp(name,node->name);
		if ( compres == 0 )
			return node->var;
		else if ( compres < 0 )
			node = node->left;
		else
			node = node->right;
	}
	return (variable*)0;
}

char assignValue(varTreeNode* root, char* name, variable* value)
{
	varTreeNode* node = root;

	int compres;
	bool nodeCreated = false;
	while (node != 0 && !nodeCreated)
	{
		compres = strcmp(name, node->name);
		if (compres == 0)
			break;
		else if ( compres < 0 )
		{
			if (node-> left == 0 )
			{
				node-> left = (varTreeNode*) malloc(sizeof(varTreeNode));
				nodeCreated = true;
			}
			node = node-> left;
		}
		else
		{
			if (node->right == 0)
			{
				node-> right = (varTreeNode*) malloc(sizeof(varTreeNode));
				nodeCreated = true;
			}
			node = node-> right;
		}
	}

	if(nodeCreated)
	{
		//set both children of the node to 0
		memset(node+sizeof(void*),0,2*sizeof(void*));

		//copy the name
		node-> name = (char*)malloc(strlen(name)+1);
		strcpy(node-> name, name);
	}
	else
	{
		if( --(node-> var-> refcount) == 0 )
			freeVar(node-> var);
	}

	//assign the variable
	//Default value
	variable* var = value;

	switch ( (value-> info) & 3)
	{
		//undefined variable
		case 0:
			break;
		//an int
		case 1:
			var = (variable*) malloc(sizeof(variable));
			var-> info = 1;
			var-> content = value -> content;
			var-> refcount = 1;
			break;
		//a string
		case 2:
		//an object
		case 3:
			++(value-> refcount);
			break;
	}
	node-> var = var;
	return 0;

}

void incrementReferences(varTreeNode* root)
{
	if(root-> left != 0)
		incrementReferences(root-> left);
	if(root-> right != 0)
		incrementReferences(root-> right);
	++(root-> var-> refcount);
}

void unlinkNode(varTreeNode* victim, varTreeNode* father)
{
	freeVar(victim-> var);
	varTreeNode* nonempty = 0;
	if( victim-> left == 0 )
		nonempty = victim-> right;
	else if (victim -> right == 0 )
		nonempty = victim-> left;
	else
	{
		//The ol' replacement trick
		varTreeNode* f = victim;
		varTreeNode* n = victim-> right;
		while (n-> left != 0)
		{
			f = n;
			n = n-> left;
		}
		free(victim-> name);
		victim-> name = n-> name;
		victim-> var = n-> var;
		n-> name = 0;
		n-> var = 0;
		unlinkNode(n,f);
		return;
	}

	if (father-> left == victim)
		father-> left = nonempty;
	else
		father -> right = nonempty;

}

//Returns true if the father should unlink that child.
bool decrementingRecursion(varTreeNode* node)
{
	if( node-> left != 0 && decrementingRecursion(node-> left) )
		unlinkNode(node-> left, node);
	if( node-> right != 0 && decrementingRecursion(node-> right) )
		unlinkNode(node -> right, node);

	return --(node-> var-> refcount);
}

void decrementReferences(varTreeNode** root)
{
	if( *root == 0 )
		return;

	if(decrementingRecursion(*root)){
		varTreeNode fakeroot;
		memset(&fakeroot,0,sizeof(fakeroot));
		fakeroot.left = *root;
		unlinkNode(*root,&fakeroot);
		*root = fakeroot.left;
	}
}

void freeVar(variable* var)
{
	//TODO implement the code for freeing a a variable.
	//This requires thinking out the object model.
}
