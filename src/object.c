#include "object.h"

#include "variableString.h"

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

variable* object_initialize( variable* prototype, variable** entries )
{
	assert( prototype != 0 );
	assert( prototype-> type == VARIABLE_TYPE_CLASS );
	assert( entries != 0 );

	variable_increment_Refs( prototype );

	class* c = prototype-> ref;
	for( unsigned char i = 0; i < c->entrycount; ++i )
	{
		struct class_entry e = c-> entries[i];
		variable* v = entries[i];
		if( e.vartype != v-> type )
		{
			fprintf(stderr,"Invalid object initialization, Type mismatch\n");
			exit(1);
		}
		variable_increment_Refs( v );
	}

	variable* objvar = variable_new();
	variable_set_type( objvar, VARIABLE_TYPE_OBJECT );
	object* o = calloc( 1, sizeof(object) );
	objvar-> ref = o;

	o-> prototype = prototype;
	o-> entries = entries;

	return objvar;
}

variable* object_member_access( variable* ob, variable* name )
{
	assert( ob != 0 );
	assert( ob-> type == VARIABLE_TYPE_OBJECT );
	assert( name != 0 );
	assert( name-> type == VARIABLE_TYPE_STRING );

	object* o = (object*)ob-> ref;
	class* cl = o-> prototype-> ref;
	for( unsigned char i = 0; i < cl-> entrycount; ++i )
	{
		if( variableString_compare(name, (cl->entries)[i].name) == 0 )
			return o-> entries[i];
	}

	fprintf(stderr, "Invalid object access: Field \"%s\" not known\n", 
		variableString_getBytes(name));
	exit(1);
}

void object_destroy( object* o )
{
	if( o == 0 )
		return;

	for( unsigned char c = 0; c < ((class*)o-> prototype-> ref)-> entrycount; ++c )
		variable_decrement_Refs( (o-> entries)[c] );

	variable_decrement_Refs( o-> prototype );
	
	free( o );
}
