
function printArray( a, length )
{
	i <- 0;
	while i < length; do
	{
		print( a[i] );
		i++;
	}
	od
}

function bubblesort ( a,length )
{
	r <- length-1;
	while (r > 0); do
	{
		l <- 0;
		while (l < r); do
		{
			if (a[l] > a[l+1]); then
			{
				b <- a[l];
				a[l] <- a[l+1];
				a[l+1] <- b;
			}
			fi
			l++;
		} od
		r--;
	} od
}

a[0] <- 3;
a[1] <- 2;
a[2] <- 1;
a[3] <- 0;

printArray( a, 4 );
bubblesort( a, 4 );
print( "--" );
printArray( a, 4 );
