# Name of the executable
PROJECT = token-chain

# Paths
SRCPATH = src/
BINPATH = bin/
OBJPATH = bin/
INCPATH = include/
LIBPATH = lib/

# Compilators
CXX = g++

# Flags
LFLAGS = 
CFLAGS = -Wall -std=c++17 -Iinclude 

# Modules
SOURCES = token-chain 

# Filenames
SOURCEFILES = $(addprefix $(SRCPATH), $(addsuffix .cpp, $(SOURCES)))
OBJECTFILES = $(addprefix $(OBJPATH), $(addsuffix .o,   $(SOURCES)))
DEPENDFILES = $(addprefix $(OBJPATH), $(addsuffix .d,   $(SOURCES)))

# Executable filename
EXECUTABLE = $(BINPATH)$(PROJECT)

# Link objects to executable
$(EXECUTABLE): $(BINPATH) $(OBJECTFILES)
	$(CXX) $(LFLAGS) $(OBJECTFILES) -ggdb -o $@

# Compile cpp units
$(OBJECTFILES): $(OBJPATH)%.o: $(SRCPATH)%.cpp
	$(CXX) $(CFLAGS) -MMD -MP -ggdb -o $@ -c $<

$(BINPATH):
	mkdir $(BINPATH)

# Include depencences of all sources
-include $(DEPENDFILES)

# Remove all binary files
clean:
	rm -f $(EXECUTABLE) $(OBJECTFILES) $(DEPENDFILES)