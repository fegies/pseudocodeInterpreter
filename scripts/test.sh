#!/bin/sh

#This script is supposed to be run from the makefile

failedTests=0
passedTests=0

for f in $(find tests -type f -name '*.txt'); do

	sdir=$(dirname "$f")
	bdir="bin/bytecode/$sdir"
	tdir="bin/testresults/${sdir#tests}"

	if [ -n "$bdir" ]; then
		mkdir -p "$bdir"
	fi
	if [ -n "$tdir" ]; then
		mkdir -p "$tdir"
	fi

	fileroot=$(basename -s .txt "$f")
	bfile="$bdir/$fileroot.pscb"
	tfile="$tdir/$fileroot.txt"

	./bin/pcompile "$sdir/$fileroot.psc" > "$bfile"

	bin/pseudocode "$bfile" > "$tfile"
	diff="$(diff "$f" "$tfile")"
	if [ -z "$diff" ]; then
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
