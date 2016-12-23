#include "variable.h"

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
	/*	case 2:
		case 3:
		case 4:	
		case 5:
		case 6:
	*/
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
