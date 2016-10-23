#include "objects.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

unsigned int classSizeof(classPrototype* c)
{
	if( c == 0 )
		return 0;

	return sizeof(classPrototype) + (c->entryCount * sizeof(struct classEntry));
}

unsigned int objectSizeof(object* o)
{
	if( o == 0 )
		return 0;

	return sizeof(object) + (o-> prototype-> entryCount * sizeof(variable*) );
}

variable* accessObjectMember(object* o, char* name)
{
	if( o == 0 || name == 0 )
		return 0;

	//figure out which pointer is the one to the desired entry
	//if it is still 0 after the checks, the access is invalid.
	unsigned char accessnum = o-> prototype-> entryCount;

	/*
		cle points to the last classEntry in the class.
		In memory:										 cle
														  |
														  v
		|classPrototype|classEntry1|classEntry2|.........|classEntryN
	*/
	struct classEntry* cle = ( (struct classEntry*)(o-> prototype + 1) ) + (accessnum - 1);

	while( accessnum > 0 )
	{
		if( strcmp(cle->entryName, name) == 0 )
			break;
		--cle;
		--accessnum;
	}

	if ( accessnum == 0 )
		return 0;
	else
		return (variable*)(o+1) + --accessnum;
}

object* instanciateObject(classPrototype* c)
{
	unsigned char ecount = c-> entryCount;
	unsigned int objsize = sizeof(object) + (ecount * sizeof(variable) );

	object* o = (object*)malloc( objsize );
	memset(o, 0, objsize);
	o-> entryCount = ecount;
	o-> prototype = c;

	//set the number of references of all variables referenced by this object to 1
	variable* curvar = (variable*)(o+1);
	while ( --ecount > 0 )
		curvar++-> refcount = 1;

	return o;
}

void destroyObject(object* o)
{
	if( o == 0 )
		return;
	unsigned char ecount = o-> entryCount;
	variable* varp = (variable*) (o+1);
	while ( --ecount > 0 )
		freeVarRefs(varp++);
	
	free(o);
}
