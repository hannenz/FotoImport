# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hannenz/FotoImport

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hannenz/FotoImport/build

# Include any dependencies generated for this target.
include CMakeFiles/fotoimport.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/fotoimport.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/fotoimport.dir/flags.make

CMakeFiles/fotoimport.dir/src/main.c.o: CMakeFiles/fotoimport.dir/flags.make
CMakeFiles/fotoimport.dir/src/main.c.o: src/main.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hannenz/FotoImport/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/fotoimport.dir/src/main.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/fotoimport.dir/src/main.c.o   -c /home/hannenz/FotoImport/build/src/main.c

CMakeFiles/fotoimport.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fotoimport.dir/src/main.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/hannenz/FotoImport/build/src/main.c > CMakeFiles/fotoimport.dir/src/main.c.i

CMakeFiles/fotoimport.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fotoimport.dir/src/main.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/hannenz/FotoImport/build/src/main.c -o CMakeFiles/fotoimport.dir/src/main.c.s

CMakeFiles/fotoimport.dir/src/main.c.o.requires:
.PHONY : CMakeFiles/fotoimport.dir/src/main.c.o.requires

CMakeFiles/fotoimport.dir/src/main.c.o.provides: CMakeFiles/fotoimport.dir/src/main.c.o.requires
	$(MAKE) -f CMakeFiles/fotoimport.dir/build.make CMakeFiles/fotoimport.dir/src/main.c.o.provides.build
.PHONY : CMakeFiles/fotoimport.dir/src/main.c.o.provides

CMakeFiles/fotoimport.dir/src/main.c.o.provides.build: CMakeFiles/fotoimport.dir/src/main.c.o

CMakeFiles/fotoimport.dir/src/fotoimport.c.o: CMakeFiles/fotoimport.dir/flags.make
CMakeFiles/fotoimport.dir/src/fotoimport.c.o: src/fotoimport.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hannenz/FotoImport/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/fotoimport.dir/src/fotoimport.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/fotoimport.dir/src/fotoimport.c.o   -c /home/hannenz/FotoImport/build/src/fotoimport.c

CMakeFiles/fotoimport.dir/src/fotoimport.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fotoimport.dir/src/fotoimport.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/hannenz/FotoImport/build/src/fotoimport.c > CMakeFiles/fotoimport.dir/src/fotoimport.c.i

CMakeFiles/fotoimport.dir/src/fotoimport.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fotoimport.dir/src/fotoimport.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/hannenz/FotoImport/build/src/fotoimport.c -o CMakeFiles/fotoimport.dir/src/fotoimport.c.s

CMakeFiles/fotoimport.dir/src/fotoimport.c.o.requires:
.PHONY : CMakeFiles/fotoimport.dir/src/fotoimport.c.o.requires

CMakeFiles/fotoimport.dir/src/fotoimport.c.o.provides: CMakeFiles/fotoimport.dir/src/fotoimport.c.o.requires
	$(MAKE) -f CMakeFiles/fotoimport.dir/build.make CMakeFiles/fotoimport.dir/src/fotoimport.c.o.provides.build
.PHONY : CMakeFiles/fotoimport.dir/src/fotoimport.c.o.provides

CMakeFiles/fotoimport.dir/src/fotoimport.c.o.provides.build: CMakeFiles/fotoimport.dir/src/fotoimport.c.o

CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o: CMakeFiles/fotoimport.dir/flags.make
CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o: src/fotoimport_window.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hannenz/FotoImport/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o   -c /home/hannenz/FotoImport/build/src/fotoimport_window.c

CMakeFiles/fotoimport.dir/src/fotoimport_window.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fotoimport.dir/src/fotoimport_window.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/hannenz/FotoImport/build/src/fotoimport_window.c > CMakeFiles/fotoimport.dir/src/fotoimport_window.c.i

CMakeFiles/fotoimport.dir/src/fotoimport_window.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fotoimport.dir/src/fotoimport_window.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/hannenz/FotoImport/build/src/fotoimport_window.c -o CMakeFiles/fotoimport.dir/src/fotoimport_window.c.s

CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o.requires:
.PHONY : CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o.requires

CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o.provides: CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o.requires
	$(MAKE) -f CMakeFiles/fotoimport.dir/build.make CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o.provides.build
.PHONY : CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o.provides

CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o.provides.build: CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o

src/main.c: fotoimport_valac.stamp

src/fotoimport.c: src/main.c

src/fotoimport_window.c: src/main.c

fotoimport_valac.stamp: ../src/main.vala
fotoimport_valac.stamp: ../src/fotoimport.vala
fotoimport_valac.stamp: ../src/fotoimport_window.vala
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hannenz/FotoImport/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating src/main.c;src/fotoimport.c;src/fotoimport_window.c"
	/usr/bin/valac -C -b /home/hannenz/FotoImport -d /home/hannenz/FotoImport/build --pkg=gtk+-3.0 --pkg=granite --pkg=gee-1.0 --pkg=posix -X -DGETTEXT_PACKAGE="fotoimport" /home/hannenz/FotoImport/src/main.vala /home/hannenz/FotoImport/src/fotoimport.vala /home/hannenz/FotoImport/src/fotoimport_window.vala
	touch /home/hannenz/FotoImport/build/fotoimport_valac.stamp

# Object files for target fotoimport
fotoimport_OBJECTS = \
"CMakeFiles/fotoimport.dir/src/main.c.o" \
"CMakeFiles/fotoimport.dir/src/fotoimport.c.o" \
"CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o"

# External object files for target fotoimport
fotoimport_EXTERNAL_OBJECTS =

fotoimport: CMakeFiles/fotoimport.dir/src/main.c.o
fotoimport: CMakeFiles/fotoimport.dir/src/fotoimport.c.o
fotoimport: CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o
fotoimport: CMakeFiles/fotoimport.dir/build.make
fotoimport: CMakeFiles/fotoimport.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable fotoimport"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fotoimport.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/fotoimport.dir/build: fotoimport
.PHONY : CMakeFiles/fotoimport.dir/build

CMakeFiles/fotoimport.dir/requires: CMakeFiles/fotoimport.dir/src/main.c.o.requires
CMakeFiles/fotoimport.dir/requires: CMakeFiles/fotoimport.dir/src/fotoimport.c.o.requires
CMakeFiles/fotoimport.dir/requires: CMakeFiles/fotoimport.dir/src/fotoimport_window.c.o.requires
.PHONY : CMakeFiles/fotoimport.dir/requires

CMakeFiles/fotoimport.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/fotoimport.dir/cmake_clean.cmake
.PHONY : CMakeFiles/fotoimport.dir/clean

CMakeFiles/fotoimport.dir/depend: src/main.c
CMakeFiles/fotoimport.dir/depend: src/fotoimport.c
CMakeFiles/fotoimport.dir/depend: src/fotoimport_window.c
CMakeFiles/fotoimport.dir/depend: fotoimport_valac.stamp
	cd /home/hannenz/FotoImport/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hannenz/FotoImport /home/hannenz/FotoImport /home/hannenz/FotoImport/build /home/hannenz/FotoImport/build /home/hannenz/FotoImport/build/CMakeFiles/fotoimport.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/fotoimport.dir/depend
