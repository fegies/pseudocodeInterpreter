#include "object.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

variable* objectMemberAccess( variableObject* object, char* memberName )
{
	if( object == 0 || memberName == 0 )
	{
		fprintf(stderr, "Null pointer error in objectMemberAccess()\n");
		exit(1);
	}

	if( object-> type != 4 )
	{
		fprintf(stderr, "Type mismatch in objectMemberAccess()\n");
		exit(1);
	}

	objectData * obd = (objectData*)(object-> variabledata);
	for( unsigned char c = 0, ec = obd-> entrycount; c < ec; ++c )
	{
		if( strcmp( obd->entries[c].name, memberName ) == 0 )
			return obd->entries[c].var;
	}
	fprintf(stderr, "Could not access field named: %s, no such field\n", memberName);
	exit(1);
	return (variable*) 0;
}


variableObject* objectInitialize( variableClass* class )
{
	if( class == 0 )
	{
		fprintf(stderr, "Null pointer error in objectInitialize()\n");
		exit(1);
	}
	if( class-> type != 6 )
	{
		fprintf(stderr, "Mype mismatch in objectInitialize()\n");
		exit(1);
	}
	classData* cd = (classData*)(class-> variabledata-> content);

	variableObject* retval = malloc( sizeof(variable) );
	retval-> type = 4;

	struct variableData* vard = malloc( sizeof(struct variableData) );
	vard-> refcount = 1;
	retval-> variabledata = vard;

	objectData* obd = malloc( sizeof(objectData) );
	vard-> content = (void*) obd;

	obd-> entrycount = cd-> entrycount;
	obd-> entries = calloc( cd-> entrycount, sizeof(struct objectEntry) );

	for( unsigned char c = 0, ec = obd-> entrycount; c < ec; ++c )
	{
		char* nname = malloc( (strlen(cd->names[c]) + 1) * sizeof(char) );
		strcpy( nname, cd->names[c] );
		obd-> entries[c].name = nname;
	}

	return retval;
}

void objectDestroy( variableObject* object )
{
	object-> type = 0;
	objectData* obd = (objectData*) object-> variabledata-> content;
	free( object-> variabledata );
	object-> variabledata = 0;

	for(unsigned char c = 0, ec = obd-> entrycount; c < ec; ++c )
		if( obd-> entries[c].var != 0 )
			variable_decrementRefs( obd-> entries[c].var );

	free( obd-> entries );
	free( obd );
}
