##
# file: set_compiler_warnings.cmake
# author: Kumarjit Das (kumarjitdas1999@gmail.com)
# brief: Set the C compiler warnings.
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

string(CONCAT MSVC_WARNINGS /WX /W4 /w14242 /w14254 /w14263 /w14265 /w14287
                            /we4289 /w14296 /w14311 /w14545 /w14546 /w14547
                            /w14549 /w14555 /w14619 /w14640 /w14826 /w14905
                            /w14906 /w14928 /permissive-)

set(CLANG_WARNINGS -Werror -Wall -Wextra -Wpedantic -Wshadow -Wcast-align
                   -Wnon-virtual-dtor -Wold-style-cast -Woverloaded-virtual
                   -Wconversion -Wsign-conversion -Wdouble-promotion -Wunused
                   -Wnull-dereference)

set(GCC_WARNINGS ${CLANG_WARNINGS} -Wmisleading-indentation -Wduplicated-cond
                 -Wduplicated-branches -Wlogical-op -Wuseless-cast)

# Setting compiler warnings to the main target
if(MSVC)
    target_compile_options(${KDI_LIBRARY_NAME} PRIVATE ${MSVC_WARNINGS})
    write_status("Setting compiler warnings for MSVC.")
elseif(CMAKE_C_COMPILER_ID MATCHES ".*Clang")
    target_compile_options(${KDI_LIBRARY_NAME} PRIVATE ${CLANG_WARNINGS})
    write_status("Setting compiler warnings for Clang.")
elseif(CMAKE_C_COMPILER_ID STREQUAL "GNU")
    target_compile_options(${KDI_LIBRARY_NAME} PRIVATE ${GCC_WARNINGS})
    write_status("Setting compiler warnings for GNU.")
else()
    message(AUTHOR_WARNING "No compiler warnings set for ${KDI_LIBRARY_NAME}")
endif()
