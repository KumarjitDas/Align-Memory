##
# file: CMakeLists.txt
# author: Kumarjit Das (kumarjitdas1999@gmail.com)
# brief: Creates example executables from C source files.
# version: 0.9.0
# date: 2021-12-10
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

write_status("'Examples' subdirectory added.")

# Set the list of example programs
set(EXAMPLE_LIST "example-001"
                 "example-002")

# Loop through each item in the examples list
foreach(EXAMPLE_ITEM ${EXAMPLE_LIST})
    # Build an executable from the `EXAMPLE_ITEM` source
    add_executable(${EXAMPLE_ITEM} "${EXAMPLE_ITEM}.c")
    # Link the built executable with the main library
    target_link_libraries(${EXAMPLE_ITEM} PRIVATE "KDI::align_memory")

    # Check if the project builds shared libraries
    if(BUILD_SHARED_LIBS)
        # If the project builds shared libraries then set the static and shared
        # library directory to lib and executables directory to bin
        set_target_properties(
            ${EXAMPLE_ITEM} PROPERTIES
            ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
            LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
            RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
        )
    endif()
    write_status("Adding example: ${EXAMPLE_ITEM}")
endforeach()
