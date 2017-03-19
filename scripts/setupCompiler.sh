#!/bin/sh

#Usage: setupCompiler [github url]

COMPILER_URL="$1"

if [ -n bin ]; then
	mkdir -p bin
fi

cd bin

#figure out if haskell compiler is installed
ghc --help >/dev/null

if [ $? != 0 ]; then
	"ghc not found. Do you have a haskell Compiler installed?"
	exit 1
fi

git clone --depth 1 "$COMPILER_URL"

cd "pseudocodeCompiler"

cabal build

ln -s "$(pwd)/dist/build/pseudocodeCompiler/pseudocodeCompiler" ../../pcompile
