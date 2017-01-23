#include "boolean.h"

#include <assert.h>

char boolean_isTrue( variable* v )
{
	assert( v != 0 );
	assert( v-> type == VARIABLE_TYPE_BOOLEAN );

	return v-> ref != 0;
}

variable* _boolean_op( variable* v1, variable* v2, char op )
{
	assert( v1 != 0 );
	assert( v2 != 0 );
	assert( v1-> type == VARIABLE_TYPE_BOOLEAN );
	assert( v2-> type == VARIABLE_TYPE_BOOLEAN );
	long retval=0;
	switch( op )
	{
		case 0://and
			retval = v1-> ref && v2-> ref;
			break;
		case 1://or
			retval = v1-> ref || v2-> ref;
			break;
		case 2://not
			retval = !v1-> ref;
			break;
		case 3://xor
			retval = (v1-> ref || v2-> ref ) && (!v1-> ref || !v2-> ref);
			break;
	}

	variable* v = variable_new();
	variable_set_type( v, VARIABLE_TYPE_BOOLEAN );
	v-> ref = (void*)retval;
	return v;
}

variable* boolean_and( variable* v1, variable* v2 )
{
	return _boolean_op( v1, v2, 0 );
}

variable* boolean_or( variable* v1, variable* v2 )
{
	return _boolean_op( v1, v2, 1 );
}

variable* boolean_not( variable* v )
{
	return _boolean_op( v, v, 2 );
}

variable* boolean_xor( variable* v1, variable* v2 )
{
	return _boolean_op( v1, v2, 3 );
}
