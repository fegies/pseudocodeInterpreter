#include "datastructures/function.h"

#include <stdlib.h>

variable* variableFunction_new( Instruction* e,
	struct multistring_args* args )
{

	variableFunction* f = malloc( sizeof(variableFunction) );

	f-> entrypoint = e;
	f-> args = *args;

	variable* v = variable_new();
	variable_set_type( v, VARIABLE_TYPE_FUNCTION );
	v-> ref = f;

	return v;
}
