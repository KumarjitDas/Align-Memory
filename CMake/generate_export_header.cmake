message(STATUS "${__STATUS_VARIABLE} Generating export header.")

# Including the GenerateExportHeader library
include("GenerateExportHeader")

# Setting the static define variable
set(MY_STATIC_DEFINE "${__LIBRARY_NAME_UPPER}_API_STATIC_DEFINE")

# Generating the export header for the main target
generate_export_header(
    ${__LIBRARY_NAME}
    PREFIX_NAME              "KDI_"
    EXPORT_MACRO_NAME        "${__LIBRARY_NAME_UPPER}_API"
    EXPORT_FILE_NAME         "${__LIBRARY_NAME}_api.h"
    DEPRECATED_MACRO_NAME    "${__LIBRARY_NAME_UPPER}_API_DEPRECATED"
    NO_EXPORT_MACRO_NAME     "${__LIBRARY_NAME_UPPER}_API_NO_EXPORT"
    INCLUDE_GUARD_NAME       "_KDI_${__LIBRARY_NAME_UPPER}_API_H_"
    STATIC_DEFINE            ${MY_STATIC_DEFINE}
    NO_DEPRECATED_MACRO_NAME "${__LIBRARY_NAME_UPPER}_API_NOT_DEPRECATED"
    DEFINE_NO_DEPRECATED
)
# Undefining `dll export` and `dll inport` when building static library
if(NOT BUILD_SHARED_LIBS)
    set_target_properties(
        ${__LIBRARY_NAME} PROPERTIES
        COMPILE_FLAGS "-D${MY_STATIC_DEFINE}"
    )
endif()

# Setting the install destination of the export header
install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${__LIBRARY_NAME}_api.h"
        DESTINATION "include/${__LIBRARY_NAME}")
