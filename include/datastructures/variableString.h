#pragma once

//string variables and the operations that can be done with them.
//Unicode aware. Supports only UTF-8 encoding though.

#include "datastructures/variable.h"

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


variable* variableString_new();

unsigned int variableString_get_length( variable* s );

//currently only used in the implementation of variableString
char variableString_has_attribute( variable* s, char attrib );
void variableString_set_attribute( variable* s, char attrib, char value );

void variableString_setContents( variable* s, char* cont );

//currently unused, I think.
//needed to make use of the variableString cow-facilities.
void variableString_assign( variable* to, variable* from );


variable* variableString_concat( variable* first, variable* second );

//returns 0 if the strings are equal
//-1 if the first string is smaller,
//1 if the first is bigger
char variableString_compare( variable* s1, variable* s2 );

//DO NOT MODIFY THE BYTES GIVEN OUT HERE!
char* variableString_getBytes( variable* s );

//from and to are given in unicode chars, not bytes
//to is the index of the first char that will be in the substring
//from is exclusive
variable* variableString_substring( variable* s, unsigned int from, unsigned int length );

void variableString_destroy( variableString* v );

//copy on write flag
#define VARIABLESTRING_FLAGS_COW 0x1
