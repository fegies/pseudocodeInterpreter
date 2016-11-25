#include "array.h"

/**
This array implementation is part linked list, and reserves more memory if needed.
*/

#include <stdlib.h>
#include <stdio.h>
#include "constants.h"

typedef struct arrayPart arrayPart;

struct arrayPart {
	unsigned int size;
	variable** entry;
	arrayPart* next;
};

//Creates a new array part.
arrayPart* _arrayPartCreation( unsigned int reservesize )
{
	if( reservesize < ARRAYRESERVEMIN )
		reservesize = ARRAYRESERVEMIN;
	arrayPart * p   = malloc( sizeof(arrayPart) );
	p-> size        = reservesize;
	p-> entry       = calloc( reservesize, sizeof(variable*) );
	p-> next        = (arrayPart*) 0;
	return p;
}


variable* arrayAccess( variableArray* arr, unsigned int index )
{
	if( arr == 0 )
	{
		fprintf(stderr, "Null pointer Exception in arrayAccess()\n");
		exit(1);
	}

	//if there is a arry to be created
	if(  arr-> type ==  0 )
	{
		arr -> type = 3;
		struct variableData* vd = malloc( sizeof(struct variableData) );
		vd -> refcount = 1;
		vd -> content = _arrayPartCreation(index);
		arr -> variabledata = vd;
	}
	else if( arr-> type != 3 )
	{
		fprintf(stderr, "Error! Trying to access a non array variable as an array\n ");
		exit(1);
	}

	//find the part that contains the current requested index
	arrayPart* curp = arr-> variabledata-> content;
	while ( curp-> size <= index )
	{
		index -= curp-> size;
		if( curp-> next == 0 )
			curp-> next = _arrayPartCreation( index );
		curp = curp-> next;
	}

	//get the value and return the appropriate variable value.
	variable* v = (curp-> entry)[index];
	if( v == 0 )
	{
		v = calloc( 1, sizeof(variable) );
		(curp-> entry)[index] = v;
	}

	return v;
}

void destroyArray( variableArray* arr )
{
	if( arr == 0 )
		return;

	arrayPart* curp = arr-> variabledata-> content;
	while ( curp != 0 )
	{
		for( int i=0, a=curp-> size; i < a; ++i )
		{
			variable* v = (curp-> entry)[i];
			if( v != 0 )
				variable_decrementRefs( v );
		}
		free( curp-> entry );
		arrayPart* curpo = curp;
		curp = curp-> next;
		free( curpo );
	}
	free( arr-> variabledata );
	arr-> variabledata = 0;
	arr-> type = 0;
}
