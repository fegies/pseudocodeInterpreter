
function printc( a )
{
	print( a.l );
	print( a.r );
}

class c
{
	l;
	r;
}

b <- new c;
b.l <- "hi";
b.r <- "you";

printc( b );
