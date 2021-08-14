# @author Kumarjit Das
# @date   10.08.2021
cmake_minimum_required(VERSION 3.20 FATAL_ERROR)

# Validate the build configuration
include("CMake/setup_project.cmake")

# Setting the project name and other descriptions
project("${MY_PROJECT_NAME}"
        VERSION      "0.4.0"
        DESCRIPTION  "A simple C library for easy memory alignment."
        HOMEPAGE_URL "https://github.com/KumarjitDas/Align-Memory.git"
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

# Configure the versions of this project
include("CMake/configure_project_version.cmake")

# Add the source files to the main target
include("CMake/add_sources_to_target.cmake")

# Add the source files to the main target
include("CMake/include_tests.cmake")

# Adding the `Examples` directories
add_subdirectory("Examples")
