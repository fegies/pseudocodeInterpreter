#pragma once

typedef struct variable
{
	unsigned int info;
	void *content;
	unsigned short refcount;
} variable;


/*
Basic numerical operations.
These all return 0 if the addition was successful and numebers > 0 otherwise.
Error codes:
1: v1 is undefined or null
2: v2 is undefined or null
3: The pointer to result is undefined or null
4: v1 is not an int
5: v2 is not an int
*/
char addVariables(variable* result, variable* v1, variable* v2);

char subtractVariables(variable* result, variable* v1, variable* v2);

char multiplyVariables(variable* result, variable* v1, variable* v2);

char divideVariables(variable* result, variable* v1, variable* v2);


//Returns -2 if the variables are of differing types.
//-1 if v1 is smaller
//0 if they are equal
//1 if v1 is larger

//All other values are error codes.
//-2 one of the vars is undefined
//-3 the vars are not of the same type
char compare(variable* v1, variable* v2);