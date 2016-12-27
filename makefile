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
SUBPATHS   = .

#The Objects that are compiled
OBJS       = $(BASEOBS)

BASEOBS    = main.o variable.o nameStore.o execStack.o array.o variableString.o \
	class.o object.o

OPROG = $(addprefix $(ODIR)/, $(PROG))
RUNFLAGS = testscript.pseudocode


run : all
	$(OPROG) $(RUNFLAGS)

all : buildbin $(OPROG)

debug: all
	valgrind $(OPROG) $(RUNFLAGS)

clean:
	find bin -name '*.o' -delete
	rm -f $(OPROG)

.PHONY: run all clean debug flagless

#linking
$(OPROG): $(addprefix $(ODIR)/, $(OBJS))
	$(CCOMPILER) $(LINKFLAGS) -o $@ $^

#compiling
$(ODIR)/%.o : %.cpp
	$(CPPCOMPILER) $(CPPCFLAGS) -c -o $@ $< $(addprefix -I./include/,$(SUBPATHS))
$(ODIR)/%.o : %.c
	$(CCOMPILER) $(CCFLAGS) -c -o $@ $< $(addprefix -I./include/,$(SUBPATHS))

#Building the Directories if they don't exist
buildbin: | $(ODIR) $(addprefix $(ODIR)/,$(SUBPATHS))

$(ODIR):
	mkdir $(ODIR)

$(addprefix $(ODIR)/,$(SUBPATHS)):
	mkdir $@
