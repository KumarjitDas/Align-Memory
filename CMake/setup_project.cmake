# Setting the project name
set(MY_PROJECT_NAME "Align-Memory")

# Setting the main library name in both lower and upper-cases
set(MY_LIBRARY_NAME "align_memory")
string(TOUPPER "${MY_LIBRARY_NAME}" MY_LIBRARY_NAME_UPPER)

# Setting status message variable
set(MY_STATUS_VARIABLE "[${MY_PROJECT_NAME}]")

message(STATUS "${MY_STATUS_VARIABLE} Initiating the project setup.")

# Generate compile commands for IDE's
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

# Setting the `BUILD_SHARED_LIBS` variable as an option
option(BUILD_SHARED_LIBS "Build this project as a shared library." ON)
