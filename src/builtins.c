#include "builtins.h"

#include <stdio.h>

void printVar(variable* v)
{
	if( v == 0 || (v-> info & 3) == 0 )
		printf("null");
	switch ( (v-> info & 3) )
	{
		case 1:
			printf("%ld",(long int)v-> content);
			break;
		case 2:
			printf( (char*)v-> content );
			break;
	}
}

