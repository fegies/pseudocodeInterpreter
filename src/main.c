#include  <stdio.h>

#include "variable.h"
#include "objects.h"

//Initializes the global namespace.
void initGlobal()
{
	globalTree = 0;
}

int main(int argc, char** agrv)
{

	classPrototype* cpl = 0;

	printf("Size of class:%d\nPointerLocation:%d\nIncrementedPointer:%d\n",sizeof(*cpl),cpl,cpl+1);

	unsigned int a = 0;

	printf("a:%d\na-1:%d\n",a,a-1);

	initGlobal();
	return 0;
}
