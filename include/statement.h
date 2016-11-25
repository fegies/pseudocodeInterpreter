#pragma once
/* This is a node in the graph that the compiler compiles to
And that can be executed.
*/

typedef struct statement statement;

#define STATEMENTBASE char type; \
statement* next;

//type 0 (NOP)
struct statement {
	STATEMENTBASE
};

//type 1
//controls program flow depending on the value of the topmost stack member
typedef struct statementCondition {
	STATEMENTBASE
	statement* nextFalse;
} statementCondition;

//type 2
//retrieves the variable specified by the name from the lvc and pushes it onto the local stack.
typedef struct statementLVCLookup {
	STATEMENTBASE
	char* name;
} statementLVCLookup;

//type 3
//stores the top of the stack in the lvc
typedef struct statementLVCStore {
	STATEMENTBASE
	char* name;
} statementLVCStore;

//type 4
typedef struct statementArrayAccess {
	STATEMENTBASE
	unsigned int index;
} statementArrayAccess;

//type 5
typedef struct statementObjectMemberAccess {
	STATEMENTBASE
	char* name;
} statementObjectMemberAccess;

//type 6
typedef struct statementObjectInitialize {
	STATEMENTBASE
	char* classname;
} statementObjectInitialize;

//type 7
//used for class and function names.
typedef struct statementLVCLookup statementGlobalLookup;

//type 8
//used in constructing the stack.
typedef struct statementLVCStore statementGlobalStore;

//type 10
//assigns the top value of the stack to the var below it.
typedef struct statementAssignment {
	STATEMENTBASE
} statementAssignment;


/* Numeric operators:
11 is addition
12 is subtraction
13 is multiplication
14 is division */


//type 20
//stashes the variable into the temp storage register

//type 21
//receives the variable from the temp register

//type 30
//prints the variable on top of the stack to the interpreter stdout

//type 40
//ends the program

#undef STATEMENTBASE
