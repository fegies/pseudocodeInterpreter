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

	if( fread( buffer, sizeof(char), SCRIPTBUFFERSIZE, input) 
		>=
		 SCRIPTBUFFERSIZE-1 )
	{
		fprintf(stderr, "Read Script size larger than buffer of %d bytes\n",
			SCRIPTBUFFERSIZE);
		exit(1);
	}

	statement* entryStatement = buildStructure(buffer, strlen(buffer));

	interpretCode(entryStatement);

	free(buffer);
}

