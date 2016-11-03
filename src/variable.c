#include "variable.h"
#include <stdlib.h>

char variable_decrementRefs(variable* v)
{
	if( v == 0 )
		return 0;

	if( --(v-> refcount) == 0 )
	{
		//Do some freeing...
		free(v);
	}

}

void variable_incrementRefs(variable* v)
{
	if( v == 0 )
		return;
	++(v-> refcount);
}