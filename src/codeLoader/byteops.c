#include "codeLoader/byteops.h"

#include <string.h>

int32_t bytesToInt( char* bytes )
{
	int32_t i = 0;
	i |= *bytes;
	for( unsigned char c = 1; c < 4; ++c )
	{
		i <<= 8;
		i |= bytes[c];
	}
	return i;
}

size_t stringlitcpy( char** to, char* bytes )
{
	size_t length = strlen( bytes );
	*to = malloc( sizeof(char)* (length + 1) );
	strcpy( *to, bytes );
	(*to)[length] = 0;
	return length+1;
}

size_t getMultiargs( struct multistring_args** m, char* bytes )
{
	char* bo = bytes;

	size_t count = 0;

	//count the number of strings that follow.
	//the sequence is terminated by double \0
	for( int i = 0; bytes[i] != 0 ; ++count)
	{
		while(bytes[i] != 0)
			++i;
		++i;
	}
	
	char** args = malloc( count * sizeof(char*) );

	for( size_t i = 0; i < count; ++i )
		bytes += stringlitcpy( args+i, bytes );


	*m = malloc( sizeof(struct multistring_args) );
	(*m)-> count = count;
	(*m)-> args = args;

	return bytes - bo + 1;
}
