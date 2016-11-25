#include "variable.h"
#include <stdlib.h>
#include <stdio.h>

char variable_decrementRefs(variable* v)
{
	if( v == 0 || v-> type == 0 )
		return 0;

	if( --(v-> variabledata-> refcount) == 0 )
	{
		//Do some freeing...
		free(v);
		return 1;
	}
	return 0;
}

void variable_incrementRefs(variable* v)
{
	if( v == 0 )
		return;
	++(v-> variabledata-> refcount);
}

void variableAssign( variable* v1, variable* v2 )
{
	if( v1 == 0 || v2 == 0 )
	{
		fprintf(stderr, "Null pointer error in variableAssign()\n");
		exit(1);
	}

	//decrement the var referenced by v1 (free if appropriate) and if they are ojects that do contain references.
	if( v1 -> type > 2 )
		variable_decrementRefs( v1 );
	//increment the refcount if the variable is assigned by reference
	if( v2 -> type > 2 )
		variable_incrementRefs( v2 );

	//null values are always valid assignment values
	if( v1-> type == 0 || v2-> type == 0 || v1-> type == v2-> type )
		v1-> variabledata = v2-> variabledata;
	else
	{
		fprintf(stderr, "Type mismatch in variableAssign()\n");
		exit(1);
	}
}

