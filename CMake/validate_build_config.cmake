message(STATUS "${__STATUS_VARIABLE} Validating build configuration.")

set(VALID_BUILD_TYPES "Release" "Debug" "MinSizeRel" "RelWithDebInfo")
# Validate build configuration
if(NOT CMAKE_CONFIGURATION_TYPES)
    # Setting the default build type to release
    if(${CMAKE_BUILD_TYPE} STREQUAL "")
        set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build configuration" FORCE)
    endif()
    # Checking validity of build type in multiple build configuration
    list(FIND VALID_BUILD_TYPES ${CMAKE_BUILD_TYPE} INDEX)
    if(${INDEX} MATCHES -1)
        message(
            FATAL_ERROR
            "Invalid build type. Valid build types are: ${VALID_BUILD_TYPES}"
        )
    endif()
    # Setting all valid build type in multiple build configuration
    if(DEFINED CMAKE_BUILD_TYPE)
        set_property(CACHE CMAKE_BUILD_TYPE
                     PROPERTY STRINGS ${VALID_BUILD_TYPES})
    endif()
endif()
