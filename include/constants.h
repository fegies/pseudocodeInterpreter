#pragma once
//A file containing various contants

//the size of the stack for every executing function
#define EXECSTACKSIZE 10

//the size of an array segment, determines how many calls to malloc are made
//smaller sizes -> more calls
//larger sizes -> more memory consumption on sparse arrays
#define ARRAYSEGMENTSIZE 20

//the size of an instruction segment
#define INSTRBUFSIZE 512

//keeps the currently executing instruction from printing to stdout
#define NINSPRINT

//the path of the directory to check for standart library files
#define STDLIB_PATH "bin/bytecode/standartLibrary"

//the buffer size used for input 
#define READ_BUF_SIZE 1024
