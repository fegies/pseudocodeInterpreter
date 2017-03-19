#include "standartLibrary.h"

#include "instruction.h"
#include "codeLoader/byteops.h"
#include "datastructures/function.h"
#include "globals.h"

//that is what happens if you manually put the instructions in.
void preloadPrint()
{
	char* name = "print";
	struct multistring_args* args;
	char* argss = "a\0";
	getMultiargs( &args, argss );

	Instruction* is = malloc( 3 * sizeof(Instruction) );
	Instruction* lookup = is;
	Instruction* print = is+1;
	Instruction* ret = is+2;

	lookup-> type = InstrType_VarLookup;
	lookup-> additionalData = "a";
	lookup-> next = print;

	print-> type = InstrType_Print;
	print-> next = ret;

	ret-> type = InstrType_Return;

	variable* v = variableFunction_new( lookup, args );
	nameStore_put( globalVariables, name, v );
}
