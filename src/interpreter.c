#include "interpreter.h"
#include "datastructures/execStack.h"
#include "boolean.h"
#include "globals.h"
#include "datastructures/variableString.h"

void interpretPSC( Instruction* entry )
{
	nameStore* args = nameStore_create();
	variable* ret = interpretFunction( entry, args );
	variable_decrement_Refs( ret );
	nameStore_destroy( args );
}

variable* interpretFunction( Instruction* entry, nameStore* args )
{
	execStack* stack = execStack_create();
	variable* retval = 0;

	Instruction* curins = entry;
	char running = 1;
	while( running )
	{
		switch( curins -> type )
		{
			case InstrType_NOP: break;
			case InstrType_Jump:
				curins = curins-> additionalData;
				continue;
			case InstrType_ConditionalJump:
			{
				variable* v = execStack_pop( stack );
				char c = boolean_isTrue( v );
				variable_decrement_Refs( v );
				if( !c )
					curins = curins -> additionalData;
				break;
			}
			case InstrType_Return:
			{
				if( !execStack_isEmpty(stack) )
					retval = execStack_pop( stack );
				running = 0;
				break;
			}
			case InstrType_VarLookup:
				execStack_push( stack, nameStore_get( args,
					curins-> additionalData) );
				break;
			case InstrType_GlobalLookup:
				execStack_push( stack, nameStore_get( globalVariables,
					curins-> additionalData) );
				break;
			case InstrType_PushConstStr:
			{
				variable* v = variableString_new();
				variableString_setContents( v, curins-> additionalData );
				execStack_push( stack, v );
				break;
			}
			case InstrType_PushConstInt:
			{
				variable* v = variable_new();
				variable_set_type( v, VARIABLE_TYPE_INT );
				v-> ref = curins-> additionalData;
				execStack_push( stack, v );
				break;
			}
		}
		curins = curins -> next;
	}

	execStack_destroy( stack );
	return retval;
}
