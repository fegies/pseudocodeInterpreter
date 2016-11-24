#pragma once

//This header contanins constants used in the source at various locations
//in one central file for ease of tweaking.

//This variable contains the size of the buffer that is populated by the script
//Setting a buffer that is too small may cause the interpreter to be unable to load
//the script.
#define SCRIPTBUFFERSIZE (unsigned int)2000

//This variable controls the minimum amount of variables reserved when reserving a
//new array fragment.
#define ARRAYRESERVEMIN 50

//The size of the block return stack.
//This value determines the maximum number of recursion steps.
#define MAXDEPTH 20

#define EXECUTIONSTACKSIZE (unsigned int)100

//turn off diagnostic information
//#define NDEBUG
