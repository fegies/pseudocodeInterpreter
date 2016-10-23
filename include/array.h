#pragma once

#include "variable.h"

typedef struct arrayHead arrayHead;

struct arrayHead
{
	unsigned int segmentSize;
	variable* firstEntry;
	arrayHead* nextSegment;
};

//If an index that is out of the bounds of the array is requested
//more space will be reserved.
//All unused indices are zeroed out.
variable* accessArray(arrayHead* a,unsigned int index);

//creates a new array head.
//Used for the initialization of arrays.
//maxIndex is the largest index accessible in this segment after creation.
arrayHead* createArray(unsigned int maxIndex);

//frees the memory of the entire array.
//In the case of an array of references the entire array
//has to be walked through and all references decremented / freed
void destroyArray(arrayHead* a);
