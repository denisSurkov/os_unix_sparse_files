# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/denis/CLionProjects/os_unix_sparse_file

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/denis/CLionProjects/os_unix_sparse_file

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/denis/CLionProjects/os_unix_sparse_file/CMakeFiles /home/denis/CLionProjects/os_unix_sparse_file//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/denis/CLionProjects/os_unix_sparse_file/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named sparse_file

# Build rule for target.
sparse_file: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 sparse_file
.PHONY : sparse_file

# fast build rule for target.
sparse_file/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/sparse_file.dir/build.make CMakeFiles/sparse_file.dir/build
.PHONY : sparse_file/fast

#=============================================================================
# Target rules for targets named test_file_creator

# Build rule for target.
test_file_creator: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 test_file_creator
.PHONY : test_file_creator

# fast build rule for target.
test_file_creator/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_file_creator.dir/build.make CMakeFiles/test_file_creator.dir/build
.PHONY : test_file_creator/fast

src/main.o: src/main.c.o
.PHONY : src/main.o

# target to build an object file
src/main.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/sparse_file.dir/build.make CMakeFiles/sparse_file.dir/src/main.c.o
.PHONY : src/main.c.o

src/main.i: src/main.c.i
.PHONY : src/main.i

# target to preprocess a source file
src/main.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/sparse_file.dir/build.make CMakeFiles/sparse_file.dir/src/main.c.i
.PHONY : src/main.c.i

src/main.s: src/main.c.s
.PHONY : src/main.s

# target to generate assembly for a file
src/main.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/sparse_file.dir/build.make CMakeFiles/sparse_file.dir/src/main.c.s
.PHONY : src/main.c.s

src/sparse_file_processor.o: src/sparse_file_processor.c.o
.PHONY : src/sparse_file_processor.o

# target to build an object file
src/sparse_file_processor.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/sparse_file.dir/build.make CMakeFiles/sparse_file.dir/src/sparse_file_processor.c.o
.PHONY : src/sparse_file_processor.c.o

src/sparse_file_processor.i: src/sparse_file_processor.c.i
.PHONY : src/sparse_file_processor.i

# target to preprocess a source file
src/sparse_file_processor.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/sparse_file.dir/build.make CMakeFiles/sparse_file.dir/src/sparse_file_processor.c.i
.PHONY : src/sparse_file_processor.c.i

src/sparse_file_processor.s: src/sparse_file_processor.c.s
.PHONY : src/sparse_file_processor.s

# target to generate assembly for a file
src/sparse_file_processor.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/sparse_file.dir/build.make CMakeFiles/sparse_file.dir/src/sparse_file_processor.c.s
.PHONY : src/sparse_file_processor.c.s

src/test_file_creator.o: src/test_file_creator.c.o
.PHONY : src/test_file_creator.o

# target to build an object file
src/test_file_creator.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_file_creator.dir/build.make CMakeFiles/test_file_creator.dir/src/test_file_creator.c.o
.PHONY : src/test_file_creator.c.o

src/test_file_creator.i: src/test_file_creator.c.i
.PHONY : src/test_file_creator.i

# target to preprocess a source file
src/test_file_creator.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_file_creator.dir/build.make CMakeFiles/test_file_creator.dir/src/test_file_creator.c.i
.PHONY : src/test_file_creator.c.i

src/test_file_creator.s: src/test_file_creator.c.s
.PHONY : src/test_file_creator.s

# target to generate assembly for a file
src/test_file_creator.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_file_creator.dir/build.make CMakeFiles/test_file_creator.dir/src/test_file_creator.c.s
.PHONY : src/test_file_creator.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... sparse_file"
	@echo "... test_file_creator"
	@echo "... src/main.o"
	@echo "... src/main.i"
	@echo "... src/main.s"
	@echo "... src/sparse_file_processor.o"
	@echo "... src/sparse_file_processor.i"
	@echo "... src/sparse_file_processor.s"
	@echo "... src/test_file_creator.o"
	@echo "... src/test_file_creator.i"
	@echo "... src/test_file_creator.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

