#!/bin/sh

#This script is supposed to be run from the makefile

failedTests=0
passedTests=0

for f in $(find tests -type f -name '*.psc'); do

	sdir=$(dirname "$f")
	bdir="bin/bytecode/$sdir"
	tdir="bin/testresults/${sdir#tests}"

	if [ -n "$bdir" ]; then
		mkdir -p "$bdir"
	fi
	if [ -n "$tdir" ]; then
		mkdir -p "$tdir"
	fi

	fileroot=$(basename -s .psc "$f")
	bfile="$bdir/$fileroot.pscb"
	tfile="$tdir/$fileroot.txt"
	efile="$sdir/$fileroot.txt"
	scrfile="$sdir/$fileroot.sh"
	sfile="$f"

	./bin/pcompile "$sfile" > "$bfile"

	./bin/pseudocode "$bfile" > "$tfile"

	#just to suppress errors when executing tet result scripts
	if [ -e "$scrfile" ]; then
		efile="$f"
	fi

	r=$?
	diff="$(diff "$efile" "$tfile")"

	re=0
	if [ -e "$scrfile" ]; then
		/bin/sh "./$scrfile"
		re=$?
		diff=""
	fi
	if [ $r = 0 -a -z "$diff" -a $re = 0 ]; then
		passedTests=$((passedTests + 1))
	else
		echo "Test ${sdir#tests/}/$fileroot failed"
		failedTests=$((failedTests + 1))
	fi
done

if [ $failedTests = 0 ]; then
	echo "All $passedTests tests passed"
else
	echo "$passedTests passed, $failedTests failed"
	exit 1
fi
