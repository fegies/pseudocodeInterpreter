#!/bin/sh

#This script is supposed to be run from the makefile

./scripts/compilePseudocode.sh

if [ -n bin/testresults ]; then
	mkdir -p bin/testresults
fi


failedTests=0
passedTests=0

for f in tests/*.txt; do
	file=$(basename -s .txt "$f")


	bin/pseudocode bin/bytecode/$file.pscb > bin/testresults/$file.txt
	diff="$(diff bin/testresults/$file.txt tests/$file.txt)"
	if [ -z "$diff" ]; then
		passedTests=$((passedTests + 1))
	else
		echo "Test $file failed"
		failedTests=$((failedTests + 1))
	fi
done

if [ $failedTests = 0 ]; then
	echo "All $passedTests tests passed"
else
	echo "$passedTests passed, $failedTests failed"
	exit 1
fi
