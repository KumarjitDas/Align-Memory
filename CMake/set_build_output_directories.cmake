##
# file: set_build_output_directories.cmake
# author: Kumarjit Das (kumarjitdas1999@gmail.com)
# brief: Set the build output directories of this project.
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

# Setting the static and dynamic library directory to lib and executable
# directory to bin
set_target_properties(${KDI_LIBRARY_NAME} PROPERTIES
                      ARCHIVE_OUTPUT_DIRECTORY ${KDI_LIBRARY_OUTPUT_DIR}
                      LIBRARY_OUTPUT_DIRECTORY ${KDI_LIBRARY_OUTPUT_DIR}
                      RUNTIME_OUTPUT_DIRECTORY ${KDI_RUNTIME_OUTPUT_DIR})
write_status("Archive output directory set to: ${KDI_LIBRARY_OUTPUT_DIR}")
write_status("Library output directory set to: ${KDI_LIBRARY_OUTPUT_DIR}")
write_status("Runtime output directory set to: ${KDI_RUNTIME_OUTPUT_DIR}")
