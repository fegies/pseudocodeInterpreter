#include "operation.h"
#include "datastructures/variableString.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

variable* operation_add( variable* v1, variable* v2)
{
	assert( v1 != 0 );
	assert( v2 != 0 );

	assert( v1-> type == v2-> type );

	variable* result;
	switch( v1-> type )
	{
		case VARIABLE_TYPE_INT:
			result = variable_new();
			result -> ref = (void*)((long int)v1-> ref + (long int)v2-> ref);
			break;
		case VARIABLE_TYPE_STRING:
			result = variableString_concat( v1, v2 );
			break;
		default:
			fprintf(stderr, "Invalid addition type: %d\n", v1-> type);
			exit(1);
	}

	return result;
}

variable* operation_subtract( variable* v1, variable* v2)
{
	assert( v1 != 0 );
	assert( v2 != 0 );

	assert( v1-> type == v2-> type );

	variable* result;

	if( v1-> type == VARIABLE_TYPE_INT )
	{
		result = variable_new();
		result-> ref = (void*)((long int)v1-> ref - (long int)v2-> ref);
	}
	else
	{
		fprintf(stderr, "Invalid subtraction type: %d\n", v1-> type );
		exit(1);
	}

	return result;
}

variable* operation_multiply( variable* v1, variable* v2)
{
	assert( v1 != 0 );
	assert( v2 != 0 );

	assert( v1-> type == v2-> type );

	variable* result;

	if( v1-> type == VARIABLE_TYPE_INT )
	{
		result = variable_new();
		result-> ref = (void*)((long int)v1-> ref * (long int)v2-> ref);
	}
	else
	{
		fprintf(stderr, "Invalid multiplication type: %d\n", v1-> type );
		exit(1);
	}

	return result;
}

variable* operation_divide( variable* v1, variable* v2 )
{
	assert( v1 != 0 );
	assert( v2 != 0 );

	assert( v1-> type == v2-> type );

	variable* result;

	if( v1-> type == VARIABLE_TYPE_INT )
	{
		result = variable_new();
		result-> ref = (void*)((long int)v1-> ref / (long int)v2-> ref);
	}
	else
	{
		fprintf(stderr, "Invalid division type: %d\n", v1-> type );
		exit(1);
	}

	return result;
}

variable* operation_modulo( variable* v1, variable* v2)
{
	assert( v1 != 0 );
	assert( v2 != 0 );

	assert( v1-> type == v2-> type );

	variable* result;

	if( v1-> type == VARIABLE_TYPE_INT )
	{
		result = variable_new();
		result-> ref = (void*)((long int)v1-> ref % (long int)v2-> ref);
	}
	else
	{
		fprintf(stderr, "Invalid modulo type: %d\n", v1-> type );
		exit(1);
	}

	return result;
}
