#include "instruction.h"

#include <stdio.h>

void printInstruction( Instruction* i )
{
	printf("%lx--Type: %-2d, next: %lx ",
		(unsigned long)i, i-> type,
		(unsigned long) i-> next);
	unsigned long ad = (unsigned long)i -> additionalData;
	switch( i -> type )
	{
		case InstrType_Jump:
			printf("Jump to %lx", ad);
			break;
		case InstrType_ConditionalJump:
			printf("Conditional jump to %lx", ad);
			break;
		case InstrType_Return:
			printf("Function return");
			break;
		case InstrType_VarLookup:
			printf("Local Lookup of: %s", (char*)i-> additionalData );
			break;
		case InstrType_GlobalLookup:
			printf("Global Lookup of: %s", (char*)ad );
			break;
		case InstrType_PushConstStr:
			printf("Push Constant String: %s", (char*)i-> additionalData );
			break;
		case InstrType_PushConstInt:
			printf("Push Constant Int: %ld", (long)i-> additionalData);
			break;
		case InstrType_ArrayAccess:
			printf("Array Access");
			break;
		case InstrType_FunctionCall:
			printf("Function Call");
			break;
		case InstrType_ObjNew:
			printf("Object initialization of: %s",(char*) i-> additionalData );
			break;
		case InstrType_ObjMemberAcc:
			printf("Object Member access" );
			break;
		case InstrType_ArithPlus:
			printf("Plus");
			break;
		case InstrType_ArithMinus:
			printf("Minus");
			break;
		case InstrType_ArithMul:
			printf("Multiply");
			break;
		case InstrType_ArithDiv:
			printf("Divide");
			break;
		case InstrType_ArithMod:
			printf("Modulo");
			break;
		case InstrType_StackPop:
			printf("Discard top stack element");
			break;
		case InstrType_Assign:
			printf("Assign");
			break;
		case InstrType_CompareLt:
			printf("Compare_Lt");
			break;
		case InstrType_ArithInc:
			printf("Increment");
			break;
		case InstrType_BlockEnter:
			printf("Enter Block");
			break;
		case InstrType_BlockLeave:
			printf("Leave Block");
			break;
		case InstrType_Print:
			printf("Print");
			break;
	}
		printf("\n");
}
