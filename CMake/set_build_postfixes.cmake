message(STATUS "${__STATUS_VARIABLE} Setting build postfixes.")

# Add `-s` as postfix to the build output when building static libraries
if(NOT BUILD_SHARED_LIBS)
    set(STATIC_POSTFIX "-s")
endif()

# Setting build postfixes for different build configurations
set_target_properties(
    ${__LIBRARY_NAME}      PROPERTIES
    OUTPUT_NAME            "${__LIBRARY_NAME}"
    DEBUG_POSTFIX          "${STATIC_POSTFIX}-d"
    RELEASE_POSTFIX        "${STATIC_POSTFIX}"
    MINSIZEREL_POSTFIX     "${STATIC_POSTFIX}-mr"
    RELWITHDEBINFO_POSTFIX "${STATIC_POSTFIX}-rd"
)
