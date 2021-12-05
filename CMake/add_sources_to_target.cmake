##
# file: add_sources_to_target.cmake
# author: Kumarjit Das (kumarjitdas1999@gmail.com)
# brief: Add the C source files to the project library.
# version: 0.6.0
# date: 2021-12-01
#
# License(MIT License):
#
# Copyright (c) 2021 Kumarjit Das | কুমারজিৎ দাস
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
#

write_status("Adding sources to the main library target.")

# Setting the full path to Sources directory in SOURCES_DIRECTORY variable
set(SOURCES_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Sources")
set(INCLUDE_DIRECTORY "${SOURCES_DIRECTORY}/include")
set(SRC_DIRECTORY "${SOURCES_DIRECTORY}/src")

# Adding the include file to the main target
set(INCLUDE_FILE "${INCLUDE_DIRECTORY}/align_memory/align_memory.h")
target_sources(${KDI_LIBRARY_NAME} PRIVATE ${INCLUDE_FILE})

# Adding the source files to the main target
set(SRC_FILES "${SRC_DIRECTORY}/align_memory/align_memory.c"
              "${SRC_DIRECTORY}/align_memory/utility.h")
target_sources(${KDI_LIBRARY_NAME} PRIVATE ${SRC_FILES})

# Setting the install destination for include and source file
install(FILES ${INCLUDE_FILE} DESTINATION "include/align_memory")
install(FILES ${SRC_FILES} DESTINATION "src/align_memory")
