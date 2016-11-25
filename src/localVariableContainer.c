#include "localVariableContainer.h"
#include <string.h>
#include <stdlib.h>

#define CREATENEWLVC \
lvc = calloc( 1, sizeof(localVariableContainer) ); \
lvc-> name = name;

variable* LVClookupVar(localVariableContainer* lvc, char* name)
{
	if( lvc == 0 )
	{
		CREATENEWLVC
	}
	while(1)
	{
		char res = strcmp(lvc-> name, name);
		if(res < 0 )
		{
			if( lvc-> left == 0 )
			{
				CREATENEWLVC
			}
			lvc = lvc -> left;
		}
		else if( res > 0 )
		{
			if( lvc-> right == 0 )
			{
				CREATENEWLVC;
			}
			lvc = lvc -> right;
		}
		else
			return lvc-> variable;
	}
}

void LVCstoreVar(localVariableContainer* lvc, variable* var, char* name)
{
	if( lvc == 0 )
	{
		CREATENEWLVC
	}
	while(1)
	{
		char res = strcmp(lvc-> name, name);
		if(res < 0 )
		{
			if( lvc-> left == 0 )
			{
				CREATENEWLVC
			}
			lvc = lvc -> left;
		}
		else if( res > 0 )
		{
			if( lvc-> right == 0 )
			{
				CREATENEWLVC;
			}
			lvc = lvc -> right;
		}
		else
		{
			if( lvc -> variable != 0 )
				variable_decrementRefs(lvc-> variable);
			lvc-> variable = var;
		}
	}
}

#undef CREATENEWLVC

void enterBlockLVC(localVariableContainer* lvc)
{
	if( lvc == 0 )
		return;
	enterBlockLVC(lvc-> left);
	enterBlockLVC(lvc-> right);
	if( lvc-> variable != 0 )
		variable_incrementRefs(lvc-> variable);
}

void leaveBlockLVC(localVariableContainer* lvc)
{
	if( lvc == 0 )
		return;
	leaveBlockLVC(lvc-> left);
	leaveBlockLVC(lvc-> right);
	if( lvc-> variable != 0 && variable_decrementRefs(lvc-> variable) )
	{
		free( lvc-> variable );
		lvc-> variable = 0;
	}
}

void destroyLVC(localVariableContainer* lvc)
{
	if( lvc == 0 )
		return;
	destroyLVC(lvc-> left);
	destroyLVC(lvc-> right);
	if( lvc-> variable != 0 )
		variable_decrementRefs(lvc-> variable);

	free( lvc );
}
