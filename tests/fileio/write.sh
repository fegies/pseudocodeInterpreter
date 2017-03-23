#!/bin/sh

if [ -n bin/testarea/file ]; then
	exit 1
fi

if [ "$(cat bin/testarea/file)" != "sometext" ]; then
	exit 1
fi
