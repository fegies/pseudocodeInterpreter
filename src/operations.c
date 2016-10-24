#include "operations.h"

#define CHECKINTVALIDITY \
if (result == 0 || v1 == 0 || v2 == 0 ) \
return; \
if( v1->type != v2-> type || v1-> type != v2-> type || v2-> type != 1) \
return;

void addInt(variable* result, variable* v1, variable* v2)
{
}

void subtractInt(variable* result, variable* v1, variable* v2)
{
}

void multiplyInt(variable* result, variable* v1, variable* v2)
{
}

void divideInt(variable* result, variable* v1, variable* v2)
{
}

void assignValue(variable* to, variable* from)
{
}

int compareVars(variable* first, variable* second)
{
}

#undef CHECKINTVALIDITY

