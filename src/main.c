#include <stdio.h>


int main(int argc, char** argv)
{
	char usesFile = 0;
	FILE* f = stdin;
	if( argc > 1 )
	{
		usesFile = 1;
		f = fopen(argv[1],"r");
	}
	
	if(usesFile)
		fclose(f);
}
