#include "variable.h"

#include "array.h"
#include "variableString.h"
#include "object.h"

#include <assert.h>
#include <stdlib.h>

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
		case VARIABLE_TYPE_INT:
		case VARIABLE_TYPE_BOOLEAN:
			break;
		case VARIABLE_TYPE_STRING:
			variableString_destroy( v-> ref ); break;
		case VARIABLE_TYPE_ARRAY:
			array_destroy( v-> ref ); break;
		case VARIABLE_TYPE_OBJECT:
			object_destroy( v-> ref ); break;

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
