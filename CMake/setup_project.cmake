# Setting the project name in lower, upper, and mixed case
set(__PROJECT_NAME "Align-Memory")
string(TOLOWER ${__PROJECT_NAME} __PROJECT_NAME_LOWER)
string(TOUPPER ${__PROJECT_NAME} __PROJECT_NAME_UPPER)

# Setting the main library name in both lower and upper-cases
set(__LIBRARY_NAME "align_memory")
string(TOUPPER ${__LIBRARY_NAME} __LIBRARY_NAME_UPPER)

# Setting project version
set(${__LIBRARY_NAME_UPPER}_VERSION_MAJOR 0)
set(${__LIBRARY_NAME_UPPER}_VERSION_MINOR 5)
set(${__LIBRARY_NAME_UPPER}_VERSION_PATCH 0)
string(CONCAT ${__LIBRARY_NAME_UPPER}_VERSION
       "${${__LIBRARY_NAME_UPPER}_VERSION_MAJOR}."
       "${${__LIBRARY_NAME_UPPER}_VERSION_MINOR}."
       "${${__LIBRARY_NAME_UPPER}_VERSION_PATCH}")

# Setting project description
string(CONCAT ${__PROJECT_NAME_UPPER}_DESCRIPTION
       "A simple C library for easy memory alignment.")

# Setting status message variable
set(__STATUS_VARIABLE "[${__PROJECT_NAME}]")

message(STATUS "${__STATUS_VARIABLE} Initiating the project setup.")

# Generate compile commands for IDE's
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

# Setting the `BUILD_SHARED_LIBS` variable as an option
option(BUILD_SHARED_LIBS "Build this project as a shared library." ON)
