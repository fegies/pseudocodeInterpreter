#pragma once

#include <stdint.h>
#include <stdlib.h>
#include "instruction.h"

//turns four bytes into an unsigned integer
int32_t bytesToInt( char* bytes );

//returns the length of the string( including the )
size_t stringlitcpy( char** to, char* bytes  );

struct multistring_args* getMultiargs( char* bytes );
