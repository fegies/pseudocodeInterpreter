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

long integer_get( variable* v )
{
	assert( v != 0 );
	assert( v -> type == VARIABLE_TYPE_INT );
	return (long)v -> ref; 
}

void operation_assign( variable* to, variable* from )
{
	assert( to != 0 );
	assert( from != 0 );

	//evil tricks to avoid memory leaks
	variable* v = variable_new();
	v-> type = to-> type;
	v-> ref = to-> ref;
	variable_decrement_Refs( v );

	to -> type = from -> type;
	to -> ref = from -> ref;
}

//too sad there are no lambdas in c, so this had to do.
long _eq (long o1, long o2 ){ return o1 == o2; }
long _lt (long o1, long o2 ){ return o1 < o2; }
long _gt (long o1, long o2 ){ return o1 > o2; }
long _leq (long o1, long o2 ){ return o1 <= o2; }
long _geq (long o1, long o2 ){ return o1 <= o2; }

variable* _operation_compare( variable* v1, variable* v2, unsigned char mode )
{
	return 0;
	assert( v1 != 0 );
	assert( v2 != 0 );
	assert( v1 -> type == v2 -> type && v1 -> type != 0 );


	long o1, o2;
	if( v1 -> type == VARIABLE_TYPE_INT )
	{
		o1 = (long) v1 -> ref;
		o2 = (long) v2 -> ref;
	}
	else if( v1 -> type == VARIABLE_TYPE_STRING )
	{
		o1 = variableString_compare( v1, v2 );
		o2 = 0;
	}
	else
	{
		fprintf(stderr, "Invalid comparison with type: %d\n", v1 -> type);
		exit( 1 );
	}

	long (*ops[5])(long,long) =
	{
		&_eq,
		&_lt,
		&_gt,
		&_leq,
		&_geq
	};

	long res = (*ops[mode])( o1, o2 );
	variable* r = variable_new();
	variable_set_type( r, VARIABLE_TYPE_BOOLEAN );
	r-> ref = (void*) res;
}

variable* operation_compareEq( variable* v1, variable* v2 )
{
	return _operation_compare( v1, v2, 0);
}
variable* operation_compareLt( variable* v1, variable* v2 )
{
	return _operation_compare( v1, v2, 1);
}
variable* operation_compareGt( variable* v1, variable* v2 )
{
	return _operation_compare( v1, v2, 2);
}
variable* operation_compareLeq( variable* v1, variable* v2 )
{
	return _operation_compare( v1, v2, 3);
}
variable* operation_compareGeq( variable* v1, variable* v2 )
{
	return _operation_compare( v1, v2, 4);
}

variable* operation_inc( variable* v )
{
	variable* v2 = variable_new();
	variable_set_type( v2, VARIABLE_TYPE_INT );
	v2-> ref = (void*) 1;
	variable* res = operation_add( v, v2 );
	variable_decrement_Refs( v2 );
	return res;
}
variable* operation_dec( variable* v )
{
	variable* v2 = variable_new();
	variable_set_type( v2, VARIABLE_TYPE_INT );
	v2-> ref = (void*) 1;
	variable* res = operation_subtract( v, v2 );
	variable_decrement_Refs( v2 );
	return res;
}
