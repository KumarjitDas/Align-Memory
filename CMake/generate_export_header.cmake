##
# file: generate_export_header.cmake
# author: Kumarjit Das (kumarjitdas1999@gmail.com)
# brief: Generate the export header for public use.
# version: 0.7.0
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

# Including the GenerateExportHeader library
include("GenerateExportHeader")

# Setting the static define variable
set(MY_STATIC_DEFINE "${KDI_LIBRARY_NAME_UPPER}_API_STATIC_DEFINE")

# Generating the export header for the main target
generate_export_header(
    ${KDI_LIBRARY_NAME}
    PREFIX_NAME              "KDI_"
    EXPORT_MACRO_NAME        "${KDI_LIBRARY_NAME_UPPER}_API"
    EXPORT_FILE_NAME         "${KDI_LIBRARY_NAME}_api.h"
    DEPRECATED_MACRO_NAME    "${KDI_LIBRARY_NAME_UPPER}_API_DEPRECATED"
    NO_EXPORT_MACRO_NAME     "${KDI_LIBRARY_NAME_UPPER}_API_NO_EXPORT"
    INCLUDE_GUARD_NAME       "_KDI_${KDI_LIBRARY_NAME_UPPER}_API_H_"
    STATIC_DEFINE            ${MY_STATIC_DEFINE}
    NO_DEPRECATED_MACRO_NAME "${KDI_LIBRARY_NAME_UPPER}_API_NOT_DEPRECATED"
    DEFINE_NO_DEPRECATED
)
write_status("Generating export header: ${KDI_LIBRARY_NAME}_api.h")

# Undefining `dll export` and `dll inport` when building static library
if(NOT BUILD_SHARED_LIBS)
    set_target_properties(
        ${KDI_LIBRARY_NAME} PROPERTIES
        COMPILE_FLAGS "-D${MY_STATIC_DEFINE}"
    )
endif()

# Setting the install destination of the export header
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${KDI_LIBRARY_NAME}_api.h"
        DESTINATION "include/${KDI_LIBRARY_NAME}")
