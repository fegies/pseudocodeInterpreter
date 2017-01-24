#include "codeLoader/codeLoader.h"
#include "interpreter.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include "globals.h"

#define READ_BUF_SIZE 1024

int main(int argc, char** argv)
{
	FILE* f = stdin;
	char usesFile = 0;
	if( argc > 1 )
		f = fopen(argv[1],"rb");
	else
		freopen( 0 , "rb", f );

	char* bytes=0;

	if( (bytes = malloc ( READ_BUF_SIZE )) == 0 )
	{
		fprintf(stderr, "Buffer allocation failed\n");
		exit(1);
	}

	size_t length = 0;

	while (!feof(f))
	{
		size_t readbytes = fread( bytes+length , sizeof(char), READ_BUF_SIZE, f);
		length += readbytes;

		if( readbytes == READ_BUF_SIZE )
		{
			size_t news = sizeof(char) * (length + READ_BUF_SIZE);
			printf("realloc with size: %ld\n", news);
			char* newbuf = realloc( bytes, news );
			if( newbuf == 0 )
			{
				fprintf(stderr, "realloc of input buffer failed. Exiting\n");
				exit(1);
			}
			bytes = newbuf;
		}
	}

//	puts( bytes );

	if( usesFile )
		fclose( f );

	Instruction* entry = loadBytecode( bytes, length );

	free( bytes );
	interpretPSC( entry );

	return 0;
}
