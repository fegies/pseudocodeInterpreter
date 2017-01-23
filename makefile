#The program Name (Name of the resulting executable)

PROG       = pseudocode
VPATH      = src include
ODIR       = ./bin
SHAREFLAGS = -pipe -Wall -pedantic -Og
CPPCFLAGS  = $(SHAREFLAGS) -std=c++14
CCFLAGS    = $(SHAREFLAGS)
LINKFLAGS  = $(SHAREFLAGS)
CPPCOMPILER= $(CXX)
CCOMPILER  = $(CC)

#Name of subpaths inside Odir (Must be the same in ./include and ./src as well)
SUBPATHS   = . datastructures codeLoader

#The Objects that are compiled
OBJS       = $(BASEOBS) $(addprefix datastructures/, $(DATASTRUCTS)) \
	$(addprefix codeLoader/, $(CODELOADER))

BASEOBS    = main.o boolean.o operation.o

DATASTRUCTS= class.o object.o variable.o nameStore.o execStack.o array.o \
	variableString.o function.o

CODELOADER = codeLoader.o byteops.o

OPROG = $(addprefix $(ODIR)/, $(PROG))
RUNFLAGS = testscript.pseudocode


run : all
	$(OPROG) $(RUNFLAGS)

all : buildbin $(OPROG)

flagless : all
	$(OPROG)

memcheck: all
	valgrind $(OPROG) $(RUNFLAGS)

memcheckfull: all
	valgrind --leak-check=full $(OPROG) $(RUNFLAGS)

debug: all
	gdb $(OPROG)

clean:
	find bin -name '*.o' -delete
	rm -f $(OPROG)

.PHONY: run all clean memcheck memcheckfull flagless

#linking
$(OPROG): $(addprefix $(ODIR)/, $(OBJS))
	$(CCOMPILER) $(LINKFLAGS) -o $@ $^

#compiling
$(ODIR)/%.o : %.cpp
	$(CPPCOMPILER) $(CPPCFLAGS) -c -o $@ $< -I./include
$(ODIR)/%.o : %.c
	$(CCOMPILER) $(CCFLAGS) -c -o $@ $< -I./include

#Building the Directories if they don't exist
buildbin: | $(ODIR) $(addprefix $(ODIR)/,$(SUBPATHS))

$(ODIR):
	mkdir $(ODIR)

$(addprefix $(ODIR)/,$(SUBPATHS)):
	mkdir $@
