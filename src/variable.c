#include "variable.h"
#include "objects.h"
#include "array.h"

#include <stdlib.h>
#include <string.h>

varTreeNode *createNewNode(char* name)
{
	varTreeNode* cpos = malloc( sizeof(varTreeNode) );

	cpos-> name = malloc( strlen(name)+1 );
	strcpy(cpos-> name, name);

	cpos-> left = cpos-> right = 0;

	memset( &cpos->var, 0, sizeof(variable) );
	++cpos-> var.refcount;

	return cpos;
}

variable *lookupVar(varTreeNode** vtn, char* name)
{
	if( *vtn == 0 )
	{
		*vtn = createNewNode(name);
		return &(*vtn)->var ;
	}

	varTreeNode* pos = *vtn;
	while(1)
	{
		int compres = strcmp(pos-> name, name);
		if(compres == 0)
			return &pos-> var;
		else if(compres < 0)
		{
			if(pos-> left == 0)
				pos-> left = createNewNode(name);
			pos = pos-> left;
		}
		else
		{
			if(pos-> right == 0)
				pos-> right = createNewNode(name);
			pos = pos-> right;
		}
	}
}

variable* lookupGlobal(char* name)
{
	return lookupVar(&globalTree, name);
}

void incrementRefs(varTreeNode* vtn)
{
	if( vtn-> left != 0 )
		incrementRefs(vtn-> left);
	if( vtn-> right != 0 )
		incrementRefs(vtn-> right);

	++vtn-> var.refcount;
}

void decrementRefs(varTreeNode* vtn)
{
	if( vtn-> left != 0)
		decrementRefs(vtn-> left);
	if( vtn-> right != 0)
		decrementRefs(vtn-> right);

	if( --(vtn-> var.refcount) == 0 )
		freeVarRefs( &vtn-> var);
}

void freeVarRefs(variable* v)
{
	if( v == 0 )
		return;
	switch( v-> type )
	{
		//No malloc'ed memory
		case 0:
		case 1:
			break;
		//A string
		case 2:
			free( (char*) v-> contents );
			break;
		//An object
		case 3:
			destroyObject( (object*) v-> contents );
			break;
		//function or class
		//They are not deleted
		case 4:
		case 5:
			return;
		//An array
		case 6:
			destroyArray( (arrayHead*) v-> contents );
	}

	//invalidate the variable
	v-> type = 0;
	v-> contents = 0;
}
