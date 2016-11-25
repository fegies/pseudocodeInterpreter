#pragma once
/**
This header defines the Array data structure and functions to be called on it.
*/

#include "variable.h"


//This function returns a variable*.
//If there was no variable at the position specified, will create a new variable
//and return a pointer to that.
//If the arr variable is a null type variable a completetly new array will be created.
variable* arrayAccess( variableArray* arr, unsigned int index );


//frees all memory occupied by the array, decrements references of elements in the array
//and sets the type of arr to the null value.
void destroyArray( variableArray* arr );
