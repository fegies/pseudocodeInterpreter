#pragma once

#include <stdlib.h>

//loads standart library functions like print() into the global namespace.
void preloadLibraryFunctions();

void preloadCode( char* code, size_t length );

//the functions to preload
void preloadPrint();
