#include  <stdio.h>

#include "variable.h"

//Initializes the global namespace.
void initGlobal()
{
	globalTree = 0;
}

int main(int argc, char** agrv)
{
	unsigned int i = -1;
	--i;
	printf("%u\n", i);
	printf("%x\n",i);

	initGlobal();
	return 0;
}