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
		//TODO decrement the reference count of the value already in existance.
		//Free space as appropriate.
	}

	//assign the variable
	return 0;

}