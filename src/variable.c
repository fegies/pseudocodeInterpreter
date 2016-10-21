#include "variable.h"
#include "string.h"

#define CHECKINTVALIDITY \
if(v1 == 0 || (v1-> info & 3) == 0 ) \
	return 1; \
else if(v2 == 0 || (v2-> info & 3) == 0 ) \
	return 2; \
else if(result == 0 ) \
	return 3; \
else if( (v1-> info & 3) != 1) \
	return 4; \
else if( (v2-> info & 3) != 1) \
	return 5; \

char addVariables(variable* result, variable* v1, variable* v2)
{
	CHECKINTVALIDITY
	result-> content =(void*) ((long int)v1-> content + (long int)v2-> content);
	return 0;
}

char subtractVariables(variable* result, variable* v1, variable* v2)
{
	CHECKINTVALIDITY
	result-> content =(void*) ((long int)v1-> content - (long int)v2-> content);
	return 0;
}

char multiplyVariables(variable* result, variable* v1, variable* v2)
{
	CHECKINTVALIDITY
	result-> content =(void*) ((long int)v1-> content * (long int)v2-> content);
	return 0;
}

char divideVariables(variable* result, variable* v1, variable* v2)
{
	CHECKINTVALIDITY
	result-> content =(void*) ((long int)v1->content / (long int)v2-> content);
	return 0;
}

#undef CHECKINTVALIDITY

char compare(variable* v1, variable* v2)
{
	if(v1 == 0 || v2 == 0 )
		return -2;
	if( (v1->info & 3) != (v2-> info & 3) )
		return -3;

	switch( (v1-> info & 3) )
	{
		//The variables are both undefined
		case 0:
			return -2;
		case 1:
			if( (long int)v1-> content == (long int)v2-> content)
				return 0;
			else if( (long int)v1-> content < (long int)v2-> content)
				return -1;
			else
				return 1;
		case 2:
			return (char)strcmp( (char*)v1->content, (char*)v2-> content);
		case 3:
			if(v1-> content == v2-> content)
				return 0;
			else
				return 2;
	}
}