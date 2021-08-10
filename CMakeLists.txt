# @author Kumarjit Das
# @date   10.08.2021
cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

# Generate compile commands for IDE's
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

# Setting the `BUILD_SHARED_LIBS` variable as an option
option(BUILD_SHARED_LIBS "Build this project as a shared library." ON)

# Setting the project name and other descriptions
project("align_memory"
        VERSION      "0.1.0"
        DESCRIPTION  "A simple C library for easy memory alignment."
        HOMEPAGE_URL "https://KumarjitDas/Align-Memory.git"
        LANGUAGES    "C")

# Validate the build configuration
include("CMake/validate_build_config.cmake")

# Create the main library
include("CMake/create_library.cmake")

# Set the build output directories
include("CMake/set_build_output_directories.cmake")

# Set the C standard
include("CMake/set_c_standard.cmake")

# Set the compiler warnings
include("CMake/set_compiler_warnings.cmake")

# Set include directories
include("CMake/set_include_directories.cmake")

# Set build postfixes for different build configurations
include("CMake/set_build_postfixes.cmake")

# Generate export header
include("CMake/generate_export_header.cmake")

# Add the source files to the main target
include("CMake/add_sources_to_target.cmake")

# Adding the `Source`, `Tests`, and `Examples` directories
add_subdirectory("Tests")
add_subdirectory("Examples")
