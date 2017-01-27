#pragma once

#include <stdlib.h>

//loads standart library functions like print() into the global namespace.
void preloadLibraryFunctions();

//the functions to preload

//takes a variable and attemts to print it using the print instruction
// Pseudocode:
// print( a );
void preloadPrint();
