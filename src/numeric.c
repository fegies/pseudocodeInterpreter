#include "numeric.h"

#include "numeric.h"

#include <stdio.h>
#include <stdlib.h>



#define NUMERICBASE \
if( v1-> type != 2 || v2-> type != 2 ) \
{ \
	fprintf(stderr, "Type error int the numeric functions\n"); \
	exit(1); \
} \
variable* retval = malloc( sizeof(variable) ); \
retval-> type = 2; \



variable* variableNumericAdd( variable* v1, variable* v2)
{
	NUMERICBASE
	retval-> variabledata = 
	(void*)(((long int)(v1-> variabledata)) + ((long int)(v2-> variabledata)));
	return retval;
}

variable* variableNumericSubtract( variable* v1, variable* v2)
{
	NUMERICBASE
	retval-> variabledata = 
	(void*)(((long int)(v1-> variabledata)) - ((long int)(v2-> variabledata)));
	return retval;
}

variable* variableNumericMultiply( variable* v1, variable* v2)
{
	NUMERICBASE
	retval-> variabledata = 
	(void*)(((long int)(v1-> variabledata)) * ((long int)(v2-> variabledata)));
	return retval;
}
variable* variableNumericDivide( variable* v1, variable* v2)
{
	NUMERICBASE
	retval-> variabledata =
	(void*)(((long int)(v1-> variabledata)) * ((long int)(v2-> variabledata)));
	return retval;
}
