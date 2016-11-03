#pragma once
/* 
This is a just-in time compiler for the scripts.
It compiles the script to a structure of nodes in memory
(A directed graph) that can be traversed by the interpreter.
Syntax checking is performed by the compiler.
The compiler cannot check variable access or out of bounds-access or anything of the like.
*/

