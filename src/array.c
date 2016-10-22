#include "variable.h"
#include "constants.h"

variable* accessArray(arrayHead* a,unsigned int index)
{
	do {
		if ( index < a-> larestIndex )
			return a-> firstEntry + index;
		
		//The index is larger than this segment.
		//Look in the next one.
		if( nextSegment != 0 )
			a = a-> nextSegment;

		//reserve more memory (create another segment)
		else
		{
			//s is the size of the segment that must be allocated.
			unsigned int s = index - (a-> largestIndex);
			if ( s < ARRAYRESERVEMIN )
				s = ARRAYRESERVEMIN;
			arrayHead* nh = malloc(sizeof(arrayHead));
			nh-> largestIndex = s + (a-> largestIndex);
			nh-> nextSegment = 0;
			nh-> firstEntry = malloc( sizeof(variable) * s);
			a-> nextSegment = nh;
			return a-> firstEntry + index;
		}
	} while (true);
}
