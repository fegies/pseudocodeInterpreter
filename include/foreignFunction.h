#pragma once

//this header describes foreign functions and how to call them from
//the pseudocode

#include "datastructures/variable.h"

#include <stdio.h>


variable* callForeignFunction( size_t ffnum, variable** args );

/**
foreign function list:
0: fopen
1: fread
2: fwrite
3: fclose
*/
