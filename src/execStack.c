#include "execStack.h"
#include "constants.h"

#include <assert.h>
#include <stdlib.h>

void execStack_push( execStack* e, variable* v )
{
	if( e == 0 || v == 0 )
		return;
	//Stack overflow checks
	assert( e-> top < e-> size );

	variable_increment_Refs( v );
	(e-> data)[(e->top)++] = v;
}

variable* execStack_pop( execStack* e )
{
	assert ( e != 0 );
	assert ( e-> top > 0 );
	variable* v = (e-> data)[--(e-> top)];
	variable_decrement_Refs( v );
	return v;
}

variable* execStack_top( execStack* e )
{
	assert ( e != 0 );
	assert ( e-> top > 0 );
	return (e-> data)[(e-> top)-1];
}

variable** execStack_multi_top( execStack* e, unsigned int amount )
{
	assert( e != 0 );
	assert( e-> top >= amount );

	return (e-> data) + (e-> top) - amount;
}

execStack* execStack_create()
{
	execStack* es = calloc( 1, sizeof(execStack) );
	es-> data = calloc( EXECSTACKSIZE, sizeof(variable*));
	return es;
}

void execStack_destroy( execStack* e )
{
	if( e == 0 )
		return;
	while ( e-> top > 0 )
		execStack_pop( e );
	free( e-> data );
	free( e );
}
