#include "datastructures/nameStore.h"

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

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
		variable_increment_Refs( var );
		return;
	}

	struct nameStore_node* curn = n-> root;

	while ( 1 )
	{
		signed char lor = strcmp(curn-> name, name);
		if( lor == 0 )
		{
			if( curn-> var != 0 )
				variable_decrement_Refs( curn-> var );
			variable_increment_Refs( var );
			curn-> var = var;
			return;
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
		variable_increment_Refs( n-> root-> var );
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
			variable_increment_Refs( curn-> var );
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

void _nameStore_print( struct nameStore_node* n )
{
	if( n == 0 )
		return;
	_nameStore_print( n -> left );
	_nameStore_print( n -> right );
	printf("Name store contains: %s ", n-> name);
	variable_print( n-> var );
}

void nameStore_print( nameStore* n )
{
	if( n != 0 )
		_nameStore_print( n -> root );
}

void _nameStore_increfs( struct nameStore_node* n )
{
	if( n == 0 )
		return;
	_nameStore_increfs( n -> left );
	_nameStore_increfs( n -> right );
	if( n -> var != 0 )
		variable_increment_Refs( n-> var );
}

void nameStore_increfs( nameStore* n )
{
	if( n != 0 )
		_nameStore_increfs( n-> root );
}

void _nameStore_decrefs( struct nameStore_node* n )
{
	if( n == 0 )
		return;
	_nameStore_decrefs( n -> left );
	_nameStore_decrefs( n -> right );

	unsigned int r = n -> var -> refcount;
	variable_decrement_Refs( n -> var );
	//check if the variable was free()'ed
	if( r == 1 )
		n -> var = 0;
}

void nameStore_decrefs( nameStore* n )
{
	if( n != 0 )
		_nameStore_decrefs( n -> root );
}


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
