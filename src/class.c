#include "class.h"

#include <stdlib.h>

variable* class_new(unsigned char entrycount, struct class_entry* entries)
{
	class* c = calloc( 1, sizeof(class) );
	c-> entrycount = entrycount;
	c-> entries = entries;

	variable* v = variable_new();
	variable_set_type( v, VARIABLE_TYPE_CLASS );
	v-> ref = c;
	return v;
}

void class_destroy( class* c )
{
	if( c != 0 )
		free( c );
}
