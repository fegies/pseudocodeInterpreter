#include <stdio.h>
#include "varTree.h"

int main(int argc, char** argv)
{
	int i;
	long int l;
	printf("Size of int %ld.\nSize of pointer %ld\nSize of long int %ld\n",sizeof(i),sizeof(void*),sizeof(l));
	printf("Size of short %ld\n",sizeof(short));
	printf("Size of variable %ld\nSize of varTreeNode %ld\n",sizeof(struct variable),sizeof(struct varTreeNode));
	return 0;
}
