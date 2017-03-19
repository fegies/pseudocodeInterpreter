#!/bin/sh

#this script is supposed to be called from test.sh

#it compiles the content of pseudocode to bin/bytecode

if [ -z $1 ]; then
	echo "Compiling bytecode"
	cd pseudocode
	find . -type f -iname '*.psc' -exec "../$0" {} \;
else
	cd ..
	dir="$(dirname $1)"
	file="$(basename -s .psc $1).pscb"
	mkdir -p "bin/bytecode/$dir"
	./bin/pcompile "pseudocode/$1" > bin/bytecode/"$dir"/"$file"
fi
