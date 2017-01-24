#include "instruction.h"

#include <stdio.h>

void printInstruction( Instruction* i )
{
	printf("%lx--Type: %-2d, next: %lx ",i, i-> type, i-> next);
	switch( i -> type )
	{
		case InstrType_Jump:
			printf("Jump to %lx", i-> additionalData);
			break;
		case InstrType_Return:
			printf("Function return");
			break;
		case InstrType_VarLookup:
			printf("Local Lookup of: %s", i-> additionalData );
			break;
		case InstrType_GlobalLookup:
			printf("Global Lookup of: %s", i-> additionalData );
			break;
		case InstrType_PushConstInt:
			printf("Push Constant Int: %ld", (long)i-> additionalData);
			break;
		case InstrType_FunctionCall:
			printf("Function Call");
			break;
		case InstrType_ArithPlus:
			printf("Plus");
			break;
		case InstrType_StackPop:
			printf("Discard top stack element");
			break;
		case InstrType_Assign:
			printf("Assign");
			break;
	}
		printf("\n");
}
