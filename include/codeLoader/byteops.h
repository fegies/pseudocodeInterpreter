#pragma once

#include <stdint.h>
#include <stdlib.h>
#include "instruction.h"

//turns four bytes into an integer
int32_t bytesToInt( char* bytes );

//returns the length of the string( including the \0)
size_t stringlitcpy( char** to, char* bytes  );

//returns the number of bytes used by the definition
size_t getMultiargs( struct multistring_args** to, char* bytes );
