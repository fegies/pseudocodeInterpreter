#include "interpreter.h"
#include "datastructures/execStack.h"
#include "boolean.h"
#include "globals.h"
#include "datastructures/variableString.h"
#include "datastructures/function.h"
#include "datastructures/array.h"
#include "datastructures/object.h"
#include "operation.h"
#include "constants.h"

#include <stdio.h>

void interpretPSC( Instruction* entry )
{
	#ifndef NDEBUG
	printf("\nBeginning Execution\n\n");
	#endif

	nameStore* args = nameStore_create();
	variable* ret = interpretFunction( entry, args );
	variable_decrement_Refs( ret );
	nameStore_destroy( args );
}

variable* interpretFunction( Instruction* entry, nameStore* args )
{
	#ifndef NDEBUG
	printf("Entering function at %lx\n Args:\n", entry);
	nameStore_print( args );
	#endif

	execStack* stack = execStack_create();
	variable* retval = 0;

	Instruction* curins = entry;
	char running = 1;
	while( running )
	{
		#ifndef NDEBUG
		printInstruction( curins );
		#endif
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
			case InstrType_FunctionCall:
			{
				variable* f = execStack_pop( stack );
				variableFunction* vf = (variableFunction*)f-> ref;
				nameStore* args = nameStore_create();
				for( size_t i = 0; i < (vf->args).count; ++i )
				{
					variable* v = execStack_pop( stack );
					char* argname = ((vf->args).args)[i];
					nameStore_put( args, argname, v );
					variable_decrement_Refs( v );
				}
				variable* retval = interpretFunction( vf->entrypoint, args );
				
				//the execStack catches attempts to push 0 variables,
				//so this is fine.
				execStack_push( stack, retval );
				nameStore_destroy( args );
				break;
			}
			case InstrType_ArrayAccess:
			{
				variable* pos = execStack_pop( stack );
				variable* arr = execStack_pop( stack );
				long l = integer_get( pos );
				variable_decrement_Refs( pos );
				variable* v = array_get( arr, (unsigned int)l );
				variable_decrement_Refs( arr );
				execStack_push( stack, v );
				break;
			}
			case InstrType_ObjNew:
			{
				variable* class = nameStore_get( globalVariables,
					(char*)curins-> additionalData);
				variable* obj = object_initialize( class );
				execStack_push( stack, obj );
				variable_decrement_Refs( class );
				break;
			}
			case InstrType_ObjMemberAcc:
			{
				variable* obj = execStack_pop( stack );
				char* name = (char*) curins-> additionalData;
				variable* n = variableString_new();
				variableString_setContents( n, name );
				variable* mem = object_member_access( obj, n );
				variable_decrement_Refs( n );
				variable_decrement_Refs( obj );
				execStack_push( stack, mem );
				break;
			}
			case InstrType_Assign:
			{
				variable* from = execStack_pop( stack );
				variable* to = execStack_pop( stack );
				operation_assign( to, from );
				execStack_push( stack, to );
				variable_decrement_Refs( from );
				break;
			}
			//instructions from 15 to 24
			case InstrType_CompareEq:
			case InstrType_CompareLt:
			case InstrType_CompareGt:
			case InstrType_CompareLeq:
			case InstrType_CompareGeq:
			case InstrType_ArithPlus:
			case InstrType_ArithMinus:
			case InstrType_ArithMul:
			case InstrType_ArithDiv:
			case InstrType_ArithMod:
			case InstrType_LogicAnd:
			case InstrType_LogicOr:
			{
				variable* op1 = execStack_pop( stack );
				variable* op2 = execStack_pop( stack );

				//just because I want to save myself all the boilerplate
				variable* (*ops[15])(variable*, variable*) =
				{
					&operation_compareEq,
					&operation_compareLt,
					&operation_compareGt,
					&operation_compareLeq,
					&operation_compareGeq,
					&operation_add,
					&operation_subtract,
					&operation_multiply,
					&operation_divide,
					&operation_modulo,
					0,
					0,
					0,
					&boolean_and,
					&boolean_or
				};
				unsigned char offset = curins-> type - InstrType_CompareEq;
				variable* res = (*ops[offset])(op1,op2);

				variable_decrement_Refs( op1 );
				variable_decrement_Refs( op2 );
				execStack_push( stack, res );
				break;
			}
			case InstrType_ArithInc:
			case InstrType_ArithDec:
			case InstrType_LogicNot:
			{
				variable* o = execStack_pop( stack );

				variable* (*ops[3])(variable*) =
				{
					&operation_inc,
					&operation_dec,
					&boolean_not
				};

				unsigned char offset = curins-> type - InstrType_ArithInc;
				variable* res = (*ops[offset])(o);

				variable_decrement_Refs( o );
				execStack_push( stack, res );
				break;
			}
			case InstrType_BlockEnter:
				nameStore_increfs( args );
				break;
			case InstrType_BlockLeave:
				nameStore_decrefs( args );
				break;
			case InstrType_StackPop:
				if( !execStack_isEmpty( stack ) )
					execStack_pop( stack );
				break;
			case InstrType_Print:
			{
				variable* v = execStack_pop( stack );

				switch( v-> type )
				{
					case VARIABLE_TYPE_BOOLEAN:
						if( boolean_isTrue(v) )
							printf("True\n");
						else
							printf("False\n");
						break;
					case VARIABLE_TYPE_INT:
						printf("%ld\n", (long)v-> ref );
						break;
					case VARIABLE_TYPE_STRING:
						printf("%s\n", variableString_getBytes(v) );
						break;
					default:
						fprintf(stderr,
							"Cannot print variable of type %d\n", v-> type);
				}

				variable_decrement_Refs( v );
				break;
			}
			default:
			{
				fprintf(stderr, "Invalid Type: %d\n", curins-> type);
				exit(1);
			}
		}
		curins = curins -> next;
	}

	execStack_destroy( stack );
	return retval;
}
