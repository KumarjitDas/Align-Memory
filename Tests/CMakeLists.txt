##
# file: CMakeLists.txt
# author: Kumarjit Das (kumarjitdas1999@gmail.com)
# brief: Creates tests from C source files.
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

write_status("'Tests' subdirectory added.")

# Set the list of test programs
set(TEST_LIST "kdi_get_size_for_memory_alignment"
              "kdi_get_aligned_memory_forward"
              "kdi_get_aligned_memory_backward"
              "kdi_align_memory"
              "kdi_get_actual_memory_from_aligned_memory")

# Loop through each item in the tests list
foreach(TEST_ITEM ${TEST_LIST})
    # Build an executable from the `TEST_ITEM` source
    add_executable("${TEST_ITEM}" "${TEST_ITEM}.c")
    # Link the built executable with the main library
    target_link_libraries("${TEST_ITEM}" PRIVATE "KDI::align_memory")

    # Set the test name for `TEST_ITEM`
    set(TEST_NAME "Test_${TEST_ITEM}")

    # Check if the project builds shared libraries
    if(BUILD_SHARED_LIBS)
        # If the project builds shared libraries then set the static and shared
        # library directory to lib and executables directory to bin
        set_target_properties(
            "${TEST_ITEM}" PROPERTIES
            ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
            LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
            RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
        )
        # Adding test for this executable when building shared library
        add_test(NAME              "${TEST_NAME}"
                 COMMAND           "${TEST_ITEM}"
                 WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
    else()
        # Adding test for this executable when building static library
        add_test(NAME              "${TEST_NAME}"
                 COMMAND           "${TEST_ITEM}"
                 WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/Tests")
    endif()
    write_status("Adding test: ${TEST_NAME}")
endforeach()
