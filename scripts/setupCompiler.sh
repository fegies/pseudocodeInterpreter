#!/bin/sh

#Usage: setupCompiler [github url]

COMPILER_URL="$1"

if [ -n bin ]; then
	mkdir -p bin
fi

cd bin

#figure out if haskell and cabal are installed
ghc --help >/dev/null
if [ $? != 0 ]; then
	echo "ghc not found. Do you have a haskell Compiler installed?"
	exit 1
fi
cabal --help >/dev/null
if [ $? != 0 ]; then
	echo "cabal not found. Do you have it installed?"
	exit 1
fi

git clone --depth 1 "$COMPILER_URL"

cd "pseudocodeCompiler"

cabal build

ln -s "$(pwd)/dist/build/pseudocodeCompiler/pseudocodeCompiler" ../pcompile
