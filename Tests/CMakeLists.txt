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

# Setting the tests output and working directories
set(_KDI_TESTS_LIBRARY_OUTPUT_DIR "${CMAKE_BINARY_DIR}/Tests")
set(_KDI_TESTS_RUNTIME_OUTPUT_DIR ${_KDI_TESTS_LIBRARY_OUTPUT_DIR})
set(_KDI_TESTS_WORKING_DIRECTORY  ${_KDI_TESTS_LIBRARY_OUTPUT_DIR})
if(NOT ${KDI_IS_MULTI_CONFIG})
    set(_KDI_TESTS_LIBRARY_OUTPUT_DIR
        "${_KDI_TESTS_LIBRARY_OUTPUT_DIR}/${CMAKE_BUILD_TYPE}")
    set(_KDI_TESTS_RUNTIME_OUTPUT_DIR
        "${_KDI_TESTS_RUNTIME_OUTPUT_DIR}/${CMAKE_BUILD_TYPE}")
    set(_KDI_TESTS_WORKING_DIRECTORY
        "${_KDI_TESTS_WORKING_DIRECTORY}/${CMAKE_BUILD_TYPE}")
endif()
if(${BUILD_SHARED_LIBS})
    set(_KDI_TESTS_LIBRARY_OUTPUT_DIR ${KDI_LIBRARY_OUTPUT_DIR})
    set(_KDI_TESTS_RUNTIME_OUTPUT_DIR ${KDI_RUNTIME_OUTPUT_DIR})
    set(_KDI_TESTS_WORKING_DIRECTORY  ${KDI_RUNTIME_OUTPUT_DIR})
endif()
# Loop through each item in the tests list
foreach(TEST_ITEM ${TEST_LIST})
    # Setting the current test target name
    set(TEST_TARGET "test-${TEST_ITEM}")
    # Build an executable from the `TEST_TARGET` source
    add_executable(${TEST_TARGET} "${TEST_ITEM}.c")
    # Link the built executable with the main library
    target_link_libraries(${TEST_TARGET} PRIVATE "KDI::${KDI_LIBRARY_NAME}")
    # Setting build postfixes for different build configurations
    set_target_properties(
        ${TEST_TARGET}         PROPERTIES
        DEBUG_POSTFIX          "${KDI_STATIC_POSTFIX}-d"
        RELEASE_POSTFIX        "${KDI_STATIC_POSTFIX}"
        MINSIZEREL_POSTFIX     "${KDI_STATIC_POSTFIX}-mr"
        RELWITHDEBINFO_POSTFIX "${KDI_STATIC_POSTFIX}-rd"
    )
    # Setting the test name for `TEST_TARGET`
    set(TEST_NAME "Test_${TEST_TARGET}")
    # If the project builds shared libraries then set the static and shared
    # library directory to lib and executables directory to bin
    set_target_properties(
        ${TEST_TARGET}           PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY ${_KDI_TESTS_LIBRARY_OUTPUT_DIR}
        LIBRARY_OUTPUT_DIRECTORY ${_KDI_TESTS_LIBRARY_OUTPUT_DIR}
        RUNTIME_OUTPUT_DIRECTORY ${_KDI_TESTS_RUNTIME_OUTPUT_DIR}
    )
    # Adding test for this executable when building static library
    add_test(NAME              ${TEST_NAME}
             COMMAND           ${TEST_TARGET}
             WORKING_DIRECTORY ${_KDI_TESTS_WORKING_DIRECTORY})
    write_status("Adding test: ${TEST_NAME}")
endforeach()
