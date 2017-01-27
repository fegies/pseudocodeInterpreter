#pragma once

typedef struct variable
{
	unsigned char type;
	unsigned int refcount;
	void* ref;
} variable;

//just does as it says on the tin
void variable_increment_Refs( variable* v );

//May free the variable after use!
void variable_decrement_Refs( variable* v );

//calls the methods of whatever the variable is referencing
//and then free()'s the variable
void _variable_free( variable* v );

//returns a new variable with a refcount initialized to 1 to prevent it
//from being deleted immediately
variable* variable_new();

//sets the variable to a new type.
//errors if the variable was not undefined before.
void variable_set_type( variable* v, unsigned char type );

//prints a string representation of the variable to stdout
//used for debugging.
void variable_print( variable* v );

//returns the variable this variable references if it is a reference
//otherwise returns the variable itself.
variable* variable_deref( variable* v );

#define VARIABLE_TYPE_NONE 0
#define VARIABLE_TYPE_BOOLEAN 1
#define VARIABLE_TYPE_INT 2
#define VARIABLE_TYPE_STRING 3
#define VARIABLE_TYPE_ARRAY 4
#define VARIABLE_TYPE_FUNCTION 5
#define VARIABLE_TYPE_OBJECT 6
#define VARIABLE_TYPE_CLASS 7
#define VARIABLE_TYPE_REFERENCE 8
