#include "foreignFunction.h"

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

#include "constants.h"
#include "datastructures/variableString.h"

void verifyTypes( uint_fast8_t num, unsigned char* types, variable** args )
{
	for( uint_fast8_t i = 0; i < num; ++i )
		if( types[i] != variable_deref(args[i])->type )
		{
			fprintf(stderr, "Type mismatch in foreignFunction call\n");
			exit( 1 );
		}
}

variable* call_fopen( variable** args );
variable* call_fread( variable** args );
variable* call_fwrite( variable** args );
variable* call_fclose( variable** args );

variable* callForeignFunction( size_t ffnum, variable** args )
{
	variable* (*funcs[])(variable**) = 
	{
		&call_fopen,
		&call_fread,
		&call_fwrite,
		&call_fclose
	};

	if( ffnum < 4 )
		return (*funcs[ffnum])(args);

	fprintf(stderr, "Trying to call nonexistant foreign function: %ld\n", ffnum);
	exit(1);
}

variable* call_fopen( variable** args )
{
	unsigned char types[] = {
		VARIABLE_TYPE_STRING,
		VARIABLE_TYPE_STRING
	};

	verifyTypes( 2, types, args );

	variable* v = variable_new();
	v-> ref = fopen( variable_deref(args[0])-> ref, variable_deref(args[1])-> ref);
	variable_set_type( v, VARIABLE_TYPE_INT );
	return v;
}

variable* call_fread( variable** args )
{
	unsigned char types[] = {
		VARIABLE_TYPE_INT
	};

	verifyTypes( 1, types, args );

	FILE* f = (FILE*) args[0]->ref;
	if( f == 0 )
	{
		fprintf(stderr, "Trying to read from null file in fread foreign function call\n");
		exit( 1 );
	}

	char* cont = malloc( READ_BUF_SIZE );
	if( cont == 0 )
	{
		fprintf(stderr, "could not allocate mem for fread call\n");
		exit(1);
	}

	size_t length = 0;
	while( !feof(f) )
	{
		size_t readbytes = fread( cont+length, sizeof(char), READ_BUF_SIZE, f);
		length += readbytes;
		if( readbytes == READ_BUF_SIZE )
		{
			size_t news = sizeof(char) * (length + READ_BUF_SIZE);
			char* newbuf = realloc( cont, news );
			if( newbuf == 0 )
			{
				fprintf(stderr, "could not realloc in fread ffcall\n");
				exit(1);
			}
			cont = newbuf;
		}
	}

	variable* v = variableString_new();
	variableString_setContents( v, cont );

	return v;
}

variable* call_fwrite( variable** args )
{
	unsigned char types[] = {
		VARIABLE_TYPE_INT,
		VARIABLE_TYPE_STRING
	};

	verifyTypes( 1, types, args );

	FILE* f = (FILE*)args[0]-> ref;
	variableString* s = (variableString*) variable_deref(args[1])->ref;
	fwrite( variableString_getBytes(args[1]), sizeof(char), s->bytecount, f);

	return 0;
}

variable* call_fclose( variable** args )
{
	unsigned char types[] = {
		VARIABLE_TYPE_INT
	};

	verifyTypes( 1, types, args );

	fclose( args[0]->ref );

	return 0; 
}
