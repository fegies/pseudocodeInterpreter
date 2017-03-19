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

				//newpath is not freed because it is remembered in loadFile
				//to ensure it is not loaded twice.
				//free( newpath );
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


