#include "variableString.h"

#include <assert.h>
#include <string.h>
#include <stdlib.h>

variableString* variableString_new()
{
	return calloc( 1, sizeof(variableString) );
}

unsigned int variableString_get_length( variable* s )
{
	assert( s != 0 );
	assert( s-> type == VARIABLE_TYPE_STRING );
	return	((variableString*)s-> ref)-> length;
}

char variableString_has_attribute( variable* s, char attrib )
{
	assert( s != 0 );
	assert( s-> type == VARIABLE_TYPE_STRING );

	return (((variableString*)s-> ref)-> flags & attrib) == attrib;
}

void variableString_set_attribute( variable* s, char attrib, char value )
{
	assert( s != 0 );
	assert( s-> type == VARIABLE_TYPE_STRING );

	variableString* v = (variableString*)s-> ref;

	if( value )
		v-> flags |= attrib;
	else
		v-> flags &= ~attrib;
}

//returns the number of bytes in the sequence started by c
char __variableString_unicodeUnitLength(char c)
{
	unsigned char count = 0,mask = 0x80;
	if( (c & mask) == mask )
	{
		for( unsigned char i = 0; i < 8 && (c & mask) == mask; ++i )
		{
			mask >>= 1;
			++count;
		}
		return count;
	}
	else
		return 1;
}

unsigned int __variableString_unicodeCount( char* s, unsigned int strlen )
{
	unsigned int count = 0;
	for( unsigned int i = 0; i < strlen; ++count )
	{
		//begin of multibyte char
		if( (s[i] & 0x80) )
			i += __variableString_unicodeUnitLength( s[i] );
		else
			++i;
	}
	return count;
}

void variableString_setContents( variable* s, char* cont )
{
	assert( s != 0 );
	assert( cont != 0 );

	variableString* v = (variableString*)s-> ref;
	if( variableString_has_attribute( s, VARIABLESTRING_FLAGS_COW ) )
		variable_decrement_Refs( v-> data );

	unsigned int a = strlen(cont)+1;
	v-> length = __variableString_unicodeCount( cont, a-1 );
	v-> bytecount = a;
	char* c = malloc( a );
	strcpy( c, cont );
	v-> data = c;
}

void variableString_assign( variable* to, variable* from )
{
	assert( to != 0 );
	assert( from != 0 );
	assert( from-> type == VARIABLE_TYPE_STRING );

	if( to-> type != VARIABLE_TYPE_STRING )
	{
		variable_set_type( to, VARIABLE_TYPE_STRING );
		to-> ref = variableString_new();
	}

	variableString* tov = (variableString*)to-> ref;
	variableString* fromv = (variableString*)from-> ref;

	if( variableString_has_attribute( to, VARIABLESTRING_FLAGS_COW) )
		variable_decrement_Refs( tov-> data );

	if( variableString_has_attribute( from, VARIABLESTRING_FLAGS_COW) )
	{
		variable_increment_Refs( fromv-> data );
		from = fromv-> data;
	}
	else
		variable_increment_Refs( from );

	variableString_set_attribute( to, VARIABLESTRING_FLAGS_COW, 1 );
	tov-> length = fromv-> length;
	tov-> bytecount = fromv-> bytecount;
	tov-> data = from;
}

variable* variableString_concat( variable* first, variable* second )
{
	assert( first != 0 );
	assert( second != 0 );
	assert( first-> type == VARIABLE_TYPE_STRING );
	assert( second-> type == VARIABLE_TYPE_STRING );

	if( variableString_has_attribute(first, VARIABLESTRING_FLAGS_COW) )
		first = ((variableString*)first-> ref)-> data;
	if( variableString_has_attribute(second, VARIABLESTRING_FLAGS_COW) )
		second = ((variableString*)second-> ref)-> data;

	variableString* vsres = variableString_new();
	variableString* vsfir = (variableString*)first-> ref;
	variableString* vssec = (variableString*)second-> ref;

	vsres-> length = vsfir-> length + vssec-> length;
	vsres-> bytecount = vsfir-> bytecount + vssec-> bytecount - 1;
	vsres-> data = malloc( vsres-> bytecount );
	strcpy( vsres-> data, vsfir-> data );
	strcat( vsres-> data, vssec-> data );

	variable* res = variable_new();
	variable_set_type( res, VARIABLE_TYPE_STRING );
	res-> ref = vsres;
	return res;
}



//takes a position in code units on the given string and returns the position
//in bytes on that same same string
unsigned int __variableString_unicode_pos_translate(
	char* c, unsigned int pos, unsigned int strlen)
{
	if( c == 0 || pos == 0 )
		return 0;

	unsigned int bytepos;
	for( bytepos = 0; bytepos < strlen && pos > 0; --pos )
	{
		if( (c[bytepos] & 0x80) == 0x80 )
		{
			bytepos += __variableString_unicodeUnitLength( c[bytepos] );
		}
		else
			++bytepos;
	}
	return bytepos;
}

//TODO: VARIABLE_STRING_SUBSTRING


void variableString_destroy( variableString* v )
{
	if( v == 0 )
		return;

	if( (v-> flags & VARIABLESTRING_FLAGS_COW) == VARIABLESTRING_FLAGS_COW )
		variable_decrement_Refs( v-> data );
	else
		free( v-> data );
	free( v );
}
