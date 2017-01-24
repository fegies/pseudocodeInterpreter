#pragma once
//A data structure to bind names to variables
//Its implementation should make it so cheap that every function can have one.

#include "datastructures/variable.h"

struct nameStore_node;

typedef struct nameStore
{
	struct nameStore_node* root;
} nameStore;

//adds the variable to the name store and increments its refcount.
//decrements the count of an old one if it was replaced.
void nameStore_put( nameStore* n, char* name, variable* var );

//returns the variable referred to by this name.
//if there was no such variable, a new, undefined one is created.
variable* nameStore_get( nameStore* n, char* name );

//destroys and frees the nameStore. Decrements the references to all vars in it.
void nameStore_destroy( nameStore* n );

void nameStore_increfs( nameStore* n );
void nameStore_decrefs( nameStore* n );

//prints the content of the namestore to stdout
//used for debugging
void nameStore_print( nameStore* n );

nameStore* nameStore_create();

//Implementation detail
struct nameStore_node
{
	char* name;
	struct nameStore_node* left;
	struct nameStore_node* right;
	variable* var;
};
