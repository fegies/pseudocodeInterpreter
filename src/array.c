#include "array.h"
#include "constants.h"

#include <stdlib.h>
#include <assert.h>

array* array_new()
{
	array* a = calloc( 1,sizeof(array) );
	a-> data = calloc( ARRAYSEGMENTSIZE, sizeof(variable*) );
	return a;
}

void array_put(array* a, unsigned int position, variable* v)
{
	if( a == 0 )
		return;
	
	if( position >= ARRAYSEGMENTSIZE )
	{
		if( a-> nextSegment == 0 )
			a-> nextSegment = array_new();
		array_put( a-> nextSegment, position - ARRAYSEGMENTSIZE, v );
	}
	else
	{
		if( (a-> data)[position] != 0 )
			variable_decrement_Refs( (a-> data)[position] );
		variable_increment_Refs( v );
		(a-> data)[position] = v;
	}
}

variable* array_get( array* a, unsigned int position )
{
	if( a == 0 )
		return 0;

	if( position >= ARRAYSEGMENTSIZE )
	{
		if( a-> nextSegment == 0 )
			a-> nextSegment = array_new();
		return array_get( a-> nextSegment, position - ARRAYSEGMENTSIZE );
	}
	else
	{
		if ( (a-> data)[position] == 0 )
			(a-> data)[position] = variable_new();
		return (a-> data)[position];
	}
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
}
