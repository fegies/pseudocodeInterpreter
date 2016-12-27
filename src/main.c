#include "variable.h"
#include "variableString.h"

#include <stdio.h>
#include <stdlib.h>

void printData( variable* v )
{
	printf("string: %s\nlength: %d\nbytes: %d\n",
		variableString_getBytes( v ),
		variableString_get_length( v ), ((variableString*)v->ref)->bytecount );
}

int main(int argc, char** argv)
{
	/*
	char usesFile = 0;
	FILE* f = stdin;
	if( argc > 1 )
	{
		usesFile = 1;
		f = fopen(argv[1],"r");
	}
	
	if(usesFile)
		fclose(f);
	*/

	variable* v = variableString_new();
	variableString_setContents( v, "ööΔB" );
	variable* v2 = variable_new();
	variableString_assign( v2, v );
	variable_decrement_Refs( v );
	printData( v2 );
	v = v2;

	variable* s = variableString_new();
	variableString_setContents( s, "lälü" );
	variable* s2 = variable_new();
	variableString_assign( s2, s );
	variable_decrement_Refs( s );
	s = s2;
	printData( s );

	variable* con = variableString_concat( v, s );

	variable_decrement_Refs( v );
	variable_decrement_Refs( s );

	variable* con2 = variable_new();
	variableString_assign( con2, con );
	variable_decrement_Refs( con );
	con = con2;
	printData( con );

	variable* subs = variableString_substring( con, 5, 3);

	printData( subs );

	return 0;
}
