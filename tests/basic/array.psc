
"It is necessary to declare the array this way because of scoping.";

a[0];

for i <- 0 to 10; do
{
	a[i] <- i;
}od

for i <- 0 to 10; do
	print( a[i] );
od
