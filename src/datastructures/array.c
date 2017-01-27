#include "datastructures/array.h"
#include "constants.h"

#include <stdlib.h>
#include <assert.h>


array* _array_new()
{
	array* a = calloc( 1,sizeof(array) );
	a-> data = calloc( ARRAYSEGMENTSIZE, sizeof(variable*) );
	return a;
}

variable* array_new()
{
	variable* v = variable_new();
	variable_set_type( v, VARIABLE_TYPE_ARRAY );
	v-> ref = _array_new();
	return v;
}

void _array_put(array* a, unsigned int position, variable* v)
{
	if( a == 0 )
		return;
	
	if( position >= ARRAYSEGMENTSIZE )
	{
		if( a-> nextSegment == 0 )
			a-> nextSegment = _array_new();
		_array_put( a-> nextSegment, position - ARRAYSEGMENTSIZE, v );
	}
	else
	{
		if( (a-> data)[position] != 0 )
			variable_decrement_Refs( (a-> data)[position] );
		variable_increment_Refs( v );
		(a-> data)[position] = v;
	}
}

void array_put( variable* a, unsigned int position, variable* v )
{
	assert( a != 0 );
	assert( a -> type == VARIABLE_TYPE_ARRAY );
	_array_put( a-> ref, position, v );
}

variable* _array_get( array* a, unsigned int position )
{
	if( a == 0 )
		return 0;

	if( position >= ARRAYSEGMENTSIZE )
	{
		if( a-> nextSegment == 0 )
			a-> nextSegment = _array_new();
		return _array_get( a-> nextSegment, position - ARRAYSEGMENTSIZE );
	}
	else
	{
		if ( (a-> data)[position] == 0 )
			(a-> data)[position] = variable_new();
		variable_increment_Refs( (a-> data)[position] );
		return (a-> data)[position];
	}
}

variable* array_get( variable* array, unsigned int position )
{
	assert( array != 0 );

	//undefined variables may be turned into arrays on use
	if( array -> type == VARIABLE_TYPE_NONE )
	{
		variable_set_type( array, VARIABLE_TYPE_ARRAY );
		array-> ref = _array_new();
	}
	assert( array-> type == VARIABLE_TYPE_ARRAY );
	return _array_get( array-> ref, position );
}

void array_destroy( array* a )
{
	if( a == 0 )
		return;

	array_destroy( a-> nextSegment );

	variable ** d = a-> data;
	for( int i = 0; i < ARRAYSEGMENTSIZE; ++i )
	{
		if( d[i] != 0 )
			variable_decrement_Refs( d[i] );
	}
	free( d );
	free( a );
}
