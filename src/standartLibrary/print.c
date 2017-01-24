#include "standartLibrary.h"

#include "instruction.h"
#include "codeLoader/byteops.h"
#include "datastructures/function.h"
#include "globals.h"

void preloadPrint()
{
	char* name = "print";
	struct multistring_args* args;
	char* argss = "a\0";
	getMultiargs( &args, argss );

	Instruction* lookup = malloc( sizeof(Instruction) );
	Instruction* print = malloc( sizeof(Instruction) );
	Instruction* ret = malloc( sizeof(Instruction) );

	lookup-> type = InstrType_VarLookup;
	lookup-> additionalData = "a";
	lookup-> next = print;

	print-> type = InstrType_Print;
	print-> next = ret;

	ret-> type = InstrType_Return;

	variable* v = variableFunction_new( lookup, args );
	nameStore_put( globalVariables, name, v );
}
