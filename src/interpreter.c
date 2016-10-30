#include "interpreter.h"
#include "constants.h"
#include "variable.h"

#include <string.h>
#include <stdlib.h>
#include <stdio.h>


void interpretFile(FILE* input)
{

	char* buffer = calloc(SCRIPTBUFFERSIZE, sizeof(char) );

	if( buffer == 0 )
	{
		fprintf(stderr,"could not reserve memory: %d bytes\n", SCRIPTBUFFERSIZE);
		exit(1);
	}

	unsigned int reads = fread( buffer, sizeof(char), SCRIPTBUFFERSIZE, input);

	if( reads >= SCRIPTBUFFERSIZE-1 )
	{
		fprintf(stderr, "Read Script size larger than buffer of %d bytes\n", SCRIPTBUFFERSIZE);
		exit(1);
	}

	variable* rootreturnval = 0;

	localVariableContainer rootstack;
	memset( &rootstack, 0, sizeof(localVariableContainer) );

	interpretFunction(buffer,&rootreturnval, &rootstack);

	destroyLVC(&rootstack);
	free(buffer);
}

