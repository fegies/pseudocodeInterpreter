#include "localVariableContainer.h"
#include <string.h>
#include <stdlib.h>
#include <assert.h>


localVariableContainer* _LVCLookup( localVariableContainer* start, char* name)
{
	#define newLVC \
	localVariableContainer* nc = \
	(localVariableContainer*) calloc( 1,sizeof(localVariableContainer) ); \
	nc-> name = name; \

	assert( start != 0 && name != 0 );

	localVariableContainer* curp = start;

	while ( 1 )
	{
		switch( strcmp( name, curp-> name ) )
		{
			case  0: return curp;
			case -1:
			{
				if( curp-> left == 0 )
				{
					newLVC
					curp-> left = nc;
				}
				break;
			}
			case  1:
			{
				if( curp-> right == 0 )
				{
					newLVC
					curp-> right = nc;
				}
				break;
			}
		}
	}
	#undef newLVC
}

variable* LVClookupVar( localVariableContainer* lvc, char* name )
{
	localVariableContainer* l = _LVCLookup( lvc, name );
	assert ( l != 0 );
	return l-> variable;
}

void LVCStoreVar( localVariableContainer* lvc, variable* var, char* name )
{
	localVariableContainer* l = _LVCLookup( lvc, name );
	assert ( l != 0 );
	l-> variable = var;
}

//0 for decrementing 1 for incrementing
void _LVCTreeTraverse( localVariableContainer* lvc, char action )
{
	if( lvc == 0 )
		return;
	if( action == 0 && lvc-> variable != 0 && 
		variable_decrementRefs(lvc-> variable) == 1 )
	{
		free(lvc-> variable);
		lvc-> variable = 0;
	}
	else if( action == 1 && lvc-> variable != 0 )
		variable_incrementRefs(lvc-> variable);
	_LVCTreeTraverse( lvc-> left, action );
	_LVCTreeTraverse( lvc-> right, action );
}

void enterBlockLVC( localVariableContainer* lvc )
{
	_LVCTreeTraverse( lvc, 1 );
}

void leaveBlockLVC( localVariableContainer* lvc )
{
	_LVCTreeTraverse( lvc, 0 );
}

void destroyLVC( localVariableContainer* lvc )
{
	if( lvc == 0 )
		return;
	destroyLVC( lvc-> left );
	destroyLVC( lvc-> right );

	if( lvc-> variable != 0 )
		variable_decrementRefs( lvc-> variable );
	free( lvc );
}

variable* LVCglobalLookup( char* name )
{
	return LVClookupVar( &globalVars, name );
}

void LVCglobalStore( variable* var, char* name )
{
	LVCStoreVar( &globalVars, var, name );
}