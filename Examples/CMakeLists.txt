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

# Setting the examples output directories
set(_KDI_EXAMPLES_LIBRARY_OUTPUT_DIR "${CMAKE_BINARY_DIR}/Examples")
set(_KDI_EXAMPLES_RUNTIME_OUTPUT_DIR ${_KDI_EXAMPLES_LIBRARY_OUTPUT_DIR})
if(NOT ${KDI_IS_MULTI_CONFIG})
    set(_KDI_EXAMPLES_LIBRARY_OUTPUT_DIR
        "${_KDI_EXAMPLES_LIBRARY_OUTPUT_DIR}/${CMAKE_BUILD_TYPE}")
    set(_KDI_EXAMPLES_RUNTIME_OUTPUT_DIR
        "${_KDI_EXAMPLES_RUNTIME_OUTPUT_DIR}/${CMAKE_BUILD_TYPE}")
endif()
if(${BUILD_SHARED_LIBS})
    set(_KDI_EXAMPLES_LIBRARY_OUTPUT_DIR ${KDI_LIBRARY_OUTPUT_DIR})
    set(_KDI_EXAMPLES_RUNTIME_OUTPUT_DIR ${KDI_RUNTIME_OUTPUT_DIR})
endif()
# Loop through each item in the examples list
foreach(EXAMPLE_ITEM ${EXAMPLE_LIST})
    # Build an executable from the `EXAMPLE_ITEM` source
    add_executable(${EXAMPLE_ITEM} "${EXAMPLE_ITEM}.c")
    # Link the built executable with the main library
    target_link_libraries(${EXAMPLE_ITEM} PRIVATE "KDI::${KDI_LIBRARY_NAME}")
    # Setting build postfixes for different build configurations
    set_target_properties(
        ${EXAMPLE_ITEM}        PROPERTIES
        DEBUG_POSTFIX          "${KDI_STATIC_POSTFIX}-d"
        RELEASE_POSTFIX        "${KDI_STATIC_POSTFIX}"
        MINSIZEREL_POSTFIX     "${KDI_STATIC_POSTFIX}-mr"
        RELWITHDEBINFO_POSTFIX "${KDI_STATIC_POSTFIX}-rd"
    )
    # If the project builds shared libraries then set the static and shared
    # library directory to lib and executables directory to bin
    set_target_properties(
        ${EXAMPLE_ITEM} PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY ${_KDI_EXAMPLES_LIBRARY_OUTPUT_DIR}
        LIBRARY_OUTPUT_DIRECTORY ${_KDI_EXAMPLES_LIBRARY_OUTPUT_DIR}
        RUNTIME_OUTPUT_DIRECTORY ${_KDI_EXAMPLES_RUNTIME_OUTPUT_DIR}
    )
    write_status("Adding example: ${EXAMPLE_ITEM}")
endforeach()
