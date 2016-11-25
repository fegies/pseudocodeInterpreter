#pragma once

/*
This header defines all that has to do with variables.
*/

struct variableData
{
	unsigned int refcount;
	void* content;
};

typedef struct variable
{
	char type;
	struct variableData* variabledata;
} variable;



//decrements the reference count of this variable.
//Frees memory if applicable.
//does not actually free the variable itself
//returns 1 if the variable does not reference anything anymore
//returns 0 otherwise
char variable_decrementRefs(variable* v);

//does nothing more than just freeing some memory.
void variable_incrementRefs(variable* v);

//assingns the value of v2 to v1
void variableAssign(variable* v1, variable* v2);


//type 0 means the variable is a special null variable

//type 1
//A boolean is true when the data pointer is not a null pointer.
//it is false otherwise
typedef struct variable variableBoolean;

//type 2
//the integer value is stored in the data pointer
typedef struct variable variableInteger;

//type 3
//The pointer points to an array data structure
typedef struct variable variableArray;

//type 4
//Once again the pointer is actually used as a pointer.
typedef struct variable variableObject;

//type 5
typedef struct variable variableObject;

//type 6
typedef struct variable variableClass;
