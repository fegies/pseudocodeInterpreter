#include  <stdio.h>

#include "variable.h"

//Initializes the global namespace.
void initGlobal()
{
	globalTree = 0;
}

int main(int argc, char** agrv)
{
	char * p1 = 0;
	int * p2 = 0;
	long int * p3 = 0;

	printf("%d\n%d\n%d\n%d\n%d\n%d\n",p1,p1+1,p2,p2+1,p3,p3+1);

	initGlobal();
	return 0;
}
