#pragma once

#include <stdlib.h>

//loads standart library functions like print() into the global namespace.
void preloadLibraryFunctions();

//runs the code from the file into memory
void loadFile( char* filename );
