#pragma once
#include <stdlib.h>

typedef struct Instruction Instruction;

struct Instruction
{
	char type;
	void* additionalData;
	Instruction* next;
};


struct multistring_args
{
	size_t count;
	char** args;
};

//prints debugging info about the instruction to stdout
void printInstruction( Instruction* i );

#define InstrType_NOP 0
#define InstrType_Jump 1
#define InstrType_ConditionalJump 2
#define InstrType_FunctionDecl 3
#define InstrType_ClassDecl 4
#define InstrType_Return 5
#define InstrType_VarLookup 6
#define InstrType_GlobalLookup 7
#define InstrType_PushConstStr 8
#define InstrType_PushConstInt 9
#define InstrType_FunctionCall 10
#define InstrType_ArrayAccess 11
#define InstrType_ObjNew 12
#define InstrType_ObjMemberAcc 13
#define InstrType_Assign 14

#define InstrType_CompareEq 15
#define InstrType_CompareLt 16
#define InstrType_CompareGt 17
#define InstrType_CompareLeq 18
#define InstrType_CompareGeq 19
#define InstrType_ArithPlus 20
#define InstrType_ArithMinus 21
#define InstrType_ArithMul 22
#define InstrType_ArithDiv 23
#define InstrType_ArithMod 24

#define InstrType_ArithInc 25
#define InstrType_ArithDec 26
#define InstrType_LogicNot 27
#define InstrType_LogicAnd 28
#define InstrType_LogicOr 29
#define InstrType_BlockEnter 30
#define InstrType_BlockLeave 31
#define InstrType_StackPop 32

#define InstrType_Print 33
#define InstrType_Load 34
