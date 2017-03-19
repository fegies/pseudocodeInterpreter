#include "codeLoader/standartLibrary.h"

#include <sys/types.h>
#include <dirent.h>
#include <stdio.h>
#include <string.h>
#include "constants.h"
#include "codeLoader/codeLoader.h"

void preloadLibraryFunctions()
{
	char* libpath = STDLIB_PATH;
	size_t pathlen = strlen(libpath);

	DIR * libdir;
	struct dirent* ep;
	libdir = opendir( libpath );

	if( libdir != 0 )
	{
		while( (ep = readdir(libdir)) )
		{
			if( ep->d_type == DT_REG )
			{
				unsigned char namelen = strlen( ep->d_name );
				char* newpath = calloc( sizeof(char), pathlen + namelen + 2 );
				strcpy( newpath, libpath );
				strcat( strcat(newpath, "/"), ep->d_name );
				loadFile( newpath );
				free( newpath );
			}
		}
		closedir( libdir );
	}
	else
	{
		fprintf(stderr, "Could not open Standart library path at: %s\n", libpath);
		exit(1);
	}
}

void loadFile( char* filename )
{
	FILE* f = fopen( filename,"rb");

	if( f == 0 )
	{
		fprintf(stderr, "Could not read file: %s\n", filename);
		exit(1);
	}

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

	loadBytecode( bytes, length );

	free( bytes );
	
}
