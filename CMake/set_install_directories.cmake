message(STATUS "${__STATUS_VARIABLE} Setting installation directories.")

# Offer the user the choice of overriding the installation directories
set(__INSTALL_LIB_DIR lib CACHE PATH "Installation directory for libraries")
set(__INSTALL_BIN_DIR bin CACHE PATH "Installation directory for executables")
set(__INSTALL_INCLUDE_DIR include CACHE PATH
    "Installation directory for header files")
if(WIN32 AND NOT CYGWIN)
    set(__DEF_INSTALL_CMAKE_DIR "cmake")
else()
    set(__DEF_INSTALL_CMAKE_DIR "lib/cmake/${__LIBRARY_NAME}")
endif()
set(__INSTALL_CMAKE_DIR ${__DEF_INSTALL_CMAKE_DIR} CACHE PATH
    "Installation directory for CMake files")

# Making relative paths absolute
foreach(__X LIB BIN INCLUDE CMAKE)
    set(__VAR INSTALL_${__X}_DIR)
    if(NOT IS_ABSOLUTE "${${__VAR}}")
        set(${__VAR} "${CMAKE_INSTALL_PREFIX}/${${__VAR}}")
    endif()
endforeach()
