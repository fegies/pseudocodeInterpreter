#The program Name (Name of the resulting executable)

PROG       = pseudocode
VPATH      = src include
ODIR       = ./bin
SHAREFLAGS = -pipe -Wall -pedantic -g
CPPCFLAGS  = $(SHAREFLAGS) -std=c++14
CCFLAGS    = $(SHAREFLAGS) -std=c11
LINKFLAGS  = $(SHAREFLAGS)
CPPCOMPILER= $(CXX)
CCOMPILER  = $(CC)

#Name of subpaths inside Odir (Must be the same in ./include and ./src as well)
SUBPATHS   = . datastructures codeLoader standartLibrary

#The Objects that are compiled
OBJS       = $(BASEOBS) $(addprefix datastructures/, $(DATASTRUCTS)) \
	$(addprefix codeLoader/, $(CODELOADER)) \
	$(addprefix standartLibrary/, $(STDLIBRARY))

BASEOBS    = main.o boolean.o operation.o interpreter.o instruction.o

DATASTRUCTS= class.o object.o variable.o nameStore.o execStack.o array.o \
	variableString.o function.o

CODELOADER = codeLoader.o byteops.o

STDLIBRARY = standartLibrary.o print.o

OPROG = $(addprefix $(ODIR)/, $(PROG))
RUNFLAGS = $(PSEUDOCODE)

DEPDIR := deps
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d
COMPILE.c = $(CCOMPILER) $(DEPFLAGS) $(CCFLAGS) -c
COMPILE.cpp = $(CPPCOMPILER) $(DEPFLAGS) $(CPPCFLAGS) -c
POSTCOMPILE= mv -f $(DEPDIR)/$*.TD $(DEPDIR)/$*.d


PSEUDOCODE = program.pscb

run : all $(PSEUDOCODE)
	$(OPROG) $(RUNFLAGS)

all : buildbin $(OPROG)

flagless : all
	$(OPROG)


%.pscb: pseudocode/%.psc
	./pcompile $< > $@

memcheck: all
	valgrind $(OPROG) $(RUNFLAGS)

memcheckfull: all
	valgrind --leak-check=full $(OPROG) $(RUNFLAGS) #2>&1 | head -n 40

debug: all
	gdb $(OPROG)

clean:
	rm -r ./bin $(DEPDIR)

.PHONY: run all clean memcheck memcheckfull flagless

#linking
$(OPROG): $(addprefix $(ODIR)/, $(OBJS))
	$(CCOMPILER) $(LINKFLAGS) -o $@ $^

#compiling
$(ODIR)/%.o : %.cpp $(DEPDIR)/%.d
	$(COMPILE.cpp) -o $@ $< -I./include

$(ODIR)/%.o : %.c $(DEPDIR)/%.d
	$(COMPILE.c) -o $@ $< -I./include

#Building the Directories if they don't exist
buildbin: | $(ODIR) $(addprefix $(ODIR)/,$(SUBPATHS)) $(DEPDIR) \
	$(addprefix $(DEPDIR)/,$(SUBPATHS))

$(ODIR):
	mkdir $(ODIR)

$(DEPDIR):
	mkdir $(DEPDIR)

$(addprefix $(DEPDIR)/,$(SUBPATHS)):
	mkdir $@

$(addprefix $(ODIR)/,$(SUBPATHS)):
	mkdir $@

$(addprefix $(DEPDIR)/,$(OBJS:.o=.d)): ;
.PRECIOUS: $(DEPDIR)/%.d

-include $(addprefix $(DEPDIR)/,$(OBJS:.o=.d))
