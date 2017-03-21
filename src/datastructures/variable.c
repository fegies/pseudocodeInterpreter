#include "datastructures/variable.h"

#include "datastructures/array.h"
#include "datastructures/variableString.h"
#include "datastructures/class.h"
#include "datastructures/object.h"
#include "datastructures/function.h"

#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

void variable_increment_Refs( variable* v )
{
	if( v == 0 )
		return;
	++(v-> refcount);
}

void variable_decrement_Refs( variable* v )
{
	if ( v == 0 )
		return;

	//if the refcount is 0, it should have already been freed.
	assert( v-> refcount > 0 );

	if( --(v-> refcount) == 0 )
		_variable_free( v );
}

void _variable_free( variable* v )
{
	if ( v == 0 )
		return;
	
	switch( v -> type )
	{
		case VARIABLE_TYPE_NONE:
		case VARIABLE_TYPE_BOOLEAN:
		case VARIABLE_TYPE_INT:
			break;
		case VARIABLE_TYPE_STRING:
			variableString_destroy( v-> ref ); break;
		case VARIABLE_TYPE_ARRAY:
			array_destroy( v-> ref ); break;
		case VARIABLE_TYPE_FUNCTION:
			variableFunction_destroy( v->ref ); break;
		case VARIABLE_TYPE_OBJECT:
			object_destroy( v-> ref ); break;
		case VARIABLE_TYPE_CLASS:
			class_destroy( v-> ref ); break;
		case VARIABLE_TYPE_REFERENCE:
			variable_decrement_Refs( v-> ref ); break;
	}

	free( v );
}

//This implementation should be switched out for something more
//efficient at a later date.
variable* variable_new()
{
	variable* v = calloc( 1, sizeof(variable) );
	v-> refcount = 1;
	return v;
}

void variable_set_type( variable* v, unsigned char type )
{
	if( v == 0 )
		return;
	assert( v-> type == VARIABLE_TYPE_NONE );

	v-> type = type;
}

void variable_print( variable* v )
{
	printf("Refs : %d, Type: %d ", v-> refcount, v-> type );
	switch( v-> type )
	{
		case VARIABLE_TYPE_INT:
			printf("Content: %ld",(long)v-> ref); break;
		case VARIABLE_TYPE_REFERENCE:
			printf("Reference to : ");
			variable_print( v-> ref );
			break;
	}
	printf("\n");
}

variable* variable_deref( variable* v )
{
	assert( v != 0 );
	if( v-> type == VARIABLE_TYPE_REFERENCE )
		return v-> ref;
	else
		return v;
}
