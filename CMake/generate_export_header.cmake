# Including the GenerateExportHeader library
include("GenerateExportHeader")

# Setting the static define variable
set(MY_STATIC_DEFINE "ALIGN_MEMORY_API_STATIC_DEFINE")

# Generating the export header for the main target
generate_export_header(
    "${PROJECT_NAME}"
    PREFIX_NAME              "KDI_"
    EXPORT_MACRO_NAME        "ALIGN_MEMORY_API"
    EXPORT_FILE_NAME         "align_memory_api.h"
    DEPRECATED_MACRO_NAME    "ALIGN_MEMORY_API_DEPRECATED"
    NO_EXPORT_MACRO_NAME     "ALIGN_MEMORY_API_NO_EXPORT"
    INCLUDE_GUARD_NAME       "_KDI_ALIGN_MEMORY_API_H_"
    STATIC_DEFINE            "${MY_STATIC_DEFINE}"
    NO_DEPRECATED_MACRO_NAME "ALIGN_MEMORY_API_NOT_DEPRECATED"
    DEFINE_NO_DEPRECATED
)
# Undefining `dll export` and `dll inport` when building static library
if(NOT BUILD_SHARED_LIBS)
    set_target_properties(
        "${PROJECT_NAME}" PROPERTIES
        COMPILE_FLAGS "-D${MY_STATIC_DEFINE}"
    )
endif()
