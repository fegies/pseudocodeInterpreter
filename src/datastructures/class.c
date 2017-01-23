#include "datastructures/class.h"
#include "datastructures/variableString.h"

variable* class_new( struct multistring_args* args )
{
	variable* v = variable_new();
	variable_set_type( v, VARIABLE_TYPE_CLASS );

	size_t count = args-> count;
	variable** names = malloc( count * sizeof(variable*) );
	class* c = malloc( sizeof(class) );
	c-> entrycount = count;
	c-> names = names;

	for( size_t i = 0; i < count; ++i )
	{
		variable* v = variableString_new();
		variableString_setContents( v, (args-> args)[i] );
		names[i] = v;
	}

	v-> ref = args;
	return v;
}

void class_destroy( class* c )
{
	if( c == 0 )
		return;

	for( size_t i = 0; i < c-> entrycount; ++i )
		variable_decrement_Refs( (c->names)[i] );
	
	free( c-> names );
	free( c );
}
 
