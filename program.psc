
function printArray( a, l )
{
	i <- 0;
	while ( i < l ); do 
	{
		print( a[i] );
		i++;
	}od
}

a[0] <- 1;
a[1] <- 4;
a[2] <- 5;
a[3] <- 2;
a[4] <- 3;

printArray( a, 5 );
