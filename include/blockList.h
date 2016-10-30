#pragma once

#include "interpreter.h"
/*
A list of instruction blocks that is kept for memory management
reasons
*/

typedef struct blocklist
{
	int filledAmount;
	block* entries[50];
	blocklist* nextList
};
