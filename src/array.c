#include "array.h"
#include "constants.h"

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

variable* accessArray(arrayHead* a,unsigned int index)
{
	while (1)
	{
		//The index is in this segment
		if( index < (a-> segmentSize) )
			return (a-> firstEntry) + index;

		//Look in the next segment.
		//The next segment is counted from 0 again, so this is necessary.
		index -= a-> segmentSize;

		//There is no next segment to be accessed.
		if( (a-> nextSegment) == 0 )
			a-> nextSegment = createArray(index);

		a = a-> nextSegment;
	}
}


arrayHead* createArray(unsigned int maxIndex)
{
	unsigned int size = maxIndex + 1;
	if(size < ARRAYRESERVEMIN)
		size = ARRAYRESERVEMIN;

	arrayHead * ah = (arrayHead*) malloc( sizeof(arrayHead) );
	ah-> segmentSize = size;
	ah-> firstEntry = (variable*) malloc( size * sizeof(variable) );

	if( (ah-> firstEntry) == 0 )
	{
		fprintf(stderr, "could not reserve array memory of size %d\n",size);
		exit(EXIT_FAILURE);
	}

	memset( ah-> firstEntry, 0, size * sizeof(variable) );
	ah-> nextSegment = 0;
	return ah;
}


void destroyArray(arrayHead* a)
{
	//Destroy all the next segments
	if( a-> nextSegment != 0 )
		destroyArray(a-> nextSegment);

	variable* varp = (a-> firstEntry) + (a-> segmentSize -1);

	while( varp >= (a-> firstEntry) )
		if ( (varp-> type) > 2 )
			freeVarRefs(varp);


	free(varp);
}
