#pragma once

//string variables and the operations that can be done with them.
//Unicode aware. Supports only UTF-8 encoding though.

#include "variable.h"

//A string can be copy on write.
//if it is, data is set to be a reference to another string variable

//otherwise data contains a normal char* String

typedef struct  variableString
{
	char flags;
	//contains the number of code units in the string.
	//bacause of that it may differ from strlen(data)
	unsigned int length;
	unsigned int bytecount; //the exact length in bytes (including \0 at the end)
	void* data;
}variableString;


variableString* variableString_new();

unsigned int variableString_get_length( variable* s );

char variableString_has_attribute( variable* s, char attrib );
void variableString_set_attribute( variable* s, char attrib, char value );

void variableString_setContents( variable* s, char* cont );

void variableString_assign( variable* to, variable* from );

variable* variableString_concat( variable* first, variable* second );

//from and to are given in unicode chars, not bytes
variable* variableString_substring( variable* s, unsigned int from, unsigned int to );

void variableString_destroy( variableString* v );

//copy on write flag
#define VARIABLESTRING_FLAGS_COW 0x1
