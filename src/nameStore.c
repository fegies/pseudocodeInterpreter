#include "nameStore.h"

#include <stdlib.h>
#include <string.h>

#define newnode calloc( 1, sizeof(struct nameStore_node) )

void nameStore_put( nameStore* n, char* name, variable* var )
{
	if( n == 0 )
		return;


	if( n->root == 0 )
	{
		n-> root = newnode;
		n-> root-> name = name;
		n-> root-> var = var;
	}
	struct nameStore_node* curn = n-> root;

	while ( 1 )
	{
		signed char lor = strcmp(curn-> name, name);
		if( lor == 0 )
		{
			if( curn-> var != 0 )
				variable_decrement_Refs( curn-> var );
			curn-> var = var;
		}
		else if( lor == -1 )
		{
			if( curn-> left == 0 )
			{
				curn-> left = newnode;
				curn-> left-> name = name;
			}
			curn = curn-> left;
		}
		else
		{
			if( curn-> right == 0 )
			{
				curn-> right = newnode;
				curn-> right-> name = name;
			}
			curn = curn-> right;
		}
	}
}

variable* nameStore_get( nameStore* n, char* name )
{
	if( n == 0 )
		return 0;

	if( n->root == 0 )
	{
		n-> root = newnode;
		n-> root-> name = name;
		n-> root-> var = variable_new();
		return n-> root-> var;
	}

	struct nameStore_node* curn = n-> root;

	while ( 1 )
	{
		signed char lor = strcmp(curn-> name, name);
		if( lor == 0 )
		{
			if( curn-> var == 0 )
				curn-> var = variable_new();
			return curn-> var;
		}
		else if( lor == -1 )
		{
			if( curn-> left == 0 )
			{
				curn-> left = newnode;
				curn-> left-> name = name;
			}
			curn = curn-> left;
		}
		else
		{
			if( curn-> right == 0 )
			{
				curn-> right = newnode;
				curn-> right-> name = name;
			}
			curn = curn-> right;
		}
	}
}

#undef newnode

void __nameStore_destroy( struct nameStore_node* n )
{
	if( n == 0 )
		return;
	__nameStore_destroy( n-> left );
	__nameStore_destroy( n-> right );
	variable_decrement_Refs( n-> var );
	free( n );
}

void nameStore_destroy( nameStore* n )
{
	__nameStore_destroy( n-> root );
	free( n );
}

nameStore* nameStore_create()
{
	return calloc( 1, sizeof(nameStore) );
}
