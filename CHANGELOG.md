# Align-Memory Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.1/), and this project adheres to
[Semantic Versioning](https://semver.org/spec/v2.0.1.html).

## [Unreleased](https://github.com/KumarjitDas/Align-Memory/compare/v0.7.0...HEAD)

- *CPack* packagitg support
- *vcpkg* packagitg support

## [0.7.0](https://github.com/KumarjitDas/Align-Memory/compare/v0.6.0...v0.7.0) - 2021-12-10

### Added

- Documentation explaining explaining how memory alignment happens in
  [align_memory.c](https://github.com/KumarjitDas/Align-Memory/blob/v0.7.0/Sources/src/align_memory/align_memory.c)
  file

### Changed

- Public function names
  - `kdi_align_memory_get_allocation_size` to `kdi_get_size_for_memory_alignment`
  - `kdi_align_memory_get_aligned_address` to `kdi_align_memory`
  - `kdi_align_memory_get_actual_address` to `kdi_get_actual_memory_from_aligned_memory`

### Removed

- Triple underscores from private names
- Unnecessary comments in private source files

## [0.6.0](https://github.com/KumarjitDas/Align-Memory/compare/v0.5.0...v0.6.0) - 2021-12-05

### Added

- Documentation in all source files.
- License text as comments at the top of root
  [CMake](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/CMakeLists.txt) and
  [setup_project.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/CMake/setup_project.cmake) files and
  all the source files
- `write_status` function in to print configuring status in the terminal
- [config-static.cmake.in](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Configuration/config-static.cmake.in)
  file for static library configuration
- [config-shared.cmake.in](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Configuration/config-shared.cmake.in)
  file for shared library configuration
- More build scripts(windows batch files) in [Scripts](https://github.com/KumarjitDas/Align-Memory/tree/v0.6.0/Scripts)
  directory
  - [configure.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Scripts/configure.bat)
  - [configure-all.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Scripts/configure-all.bat)
  - [build.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Scripts/build.bat)
  - [build-all.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Scripts/build-all.bat)
  - [build-configs.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Scripts/build-configs.bat)
  - [build-all-configs.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Scripts/build-all-configs.bat)
  - [test.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Scripts/test.bat)
  - [test-all.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Scripts/test-all.bat)
  - [test-configs.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Scripts/test-configs.bat)
  - [test-all-configs.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Scripts/test-all-configs.bat)
  - [clean.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Scripts/clean.bat)
  - [clean-all.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Scripts/clean-all.bat)
- [example-001.c](https://github.com/KumarjitDas/Align-Memory/blob/v0.6.0/Examples/example-001.c) file

### Changed

- Project variable names in cmake files. Using `KDI_` instead `__`(double underscrore)
- All `message(STATUS...` cmake statements into `write_status`

### Removed

- [Git Ignore](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/.gitignore) file
- [Config.cmake.in](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/Configuration/Config.cmake.in) file
- [ex001.c](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/Examples/ex001.c) file

## [0.5.0](https://github.com/KumarjitDas/Align-Memory/compare/v0.4.0...v0.5.0) - 2021-08-24

### Added

- Install rule for version header and config/api header files in
  [configure_project_version.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/CMake/configure_project_version.cmake)
  and
  [generate_export_header.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/CMake/generate_export_header.cmake)
- Inclusion of **GNUInstallDirs** in
  [export_rules.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/CMake/export_rules.cmake)
- Inclusion of **CMakePackageConfigHelpers** in
  [package_configuration.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/CMake/package_configuration.cmake)
- Adding more compiler warning options for *Clang* and *GNU C* compilers in
  [set_compiler_warnings.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/CMake/set_compiler_warnings.cmake)
- [Scripts](https://github.com/KumarjitDas/Align-Memory/tree/v0.5.0/Scripts) directory for shell/batch scripts
  - CMake configure commands in
    [configure.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/Scripts/configure.bat) script file
  - CMake build commands in
    [build.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/Scripts/build.bat) script file
  - CTest commands in [test.bat](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/Scripts/test.bat) script file
- Copyright message in [root CMake file](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/CMakeLists.txt),
  [align_memory.h](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/Sources/include/align_memory/align_memory.h)
  ,
  [align_memory.c](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/Sources/src/align_memory/align_memory.c),
  and [utility.h](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/Sources/src/align_memory/utility.h) source
  files
- Documentation for api functions in
  [align_memory.h](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/Sources/include/align_memory/align_memory.h)
  file

### Changed

- Absolute names in
  [Config.cmake.in](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/Configuration/Config.cmake.in) file

### Removed

- Inclusion of **GNUInstallDirs** and **CMakePackageConfigHelpers** in root
  [CMake](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/CMakeLists.txt) file
- Unnecessary quotes in
  [set_include_directories.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.5.0/CMake/set_include_directories.cmake)

## [0.4.0](https://github.com/KumarjitDas/Align-Memory/compare/v0.3.0...v0.4.0) - 2021-08-16

### Added

- *___kdi_offset_t* type for offset types in
  [utility.h](https://github.com/KumarjitDas/Align-Memory/blob/v0.4.0/Sources/src/align_memory/utility.h) file
- Compiler warnings for *MSVC*, *Clang*, and *GCC*
- Package configuration and version configuration files
- [Config.cmake.in](https://github.com/KumarjitDas/Align-Memory/blob/v0.4.0/Configuration/Config.cmake.in) file in
  [Configuration](https://github.com/KumarjitDas/Align-Memory/tree/v0.4.0/Configuration) directory for the package
  configuration

### Changed

- Function definitions in
  [align_memory.c](https://github.com/KumarjitDas/Align-Memory/blob/v0.4.0/Sources/src/align_memory/align_memory.c)
  file according to the new offset type
- Tests in
  [kdi_align_memory_get_allocation_size.c](https://github.com/KumarjitDas/Align-Memory/blob/v0.4.0/Tests/kdi_align_memory_get_allocation_size.c)
  and
  [kdi_align_memory_get_aligned_address.c](https://github.com/KumarjitDas/Align-Memory/blob/v0.4.0/Tests/kdi_align_memory_get_aligned_address.c)
  files according to the new offset type
- Version number to *0.4.0* in root
  [CMake](https://github.com/KumarjitDas/Align-Memory/blob/v0.4.0/CMakeLists.txt) file

### Removed

- Unnecessary quotes from all standalone variables in all of the
  [CMake](https://github.com/KumarjitDas/Align-Memory/tree/v0.4.0/CMake) files

## [0.3.0](https://github.com/KumarjitDas/Align-Memory/compare/v0.2.0...v0.3.0) - 2021-08-13

### Added

- Status messages in all **CMake** files
- [setup_project.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.3.0/CMake/setup_project.cmake) and
  [configure_project_version.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.3.0/CMake/configure_project_version.cmake)
  files
- Seperate *PROJECT_NAME* and *LIBRARY_NAME* in root
  [CMake](https://github.com/KumarjitDas/Align-Memory/blob/v0.3.0/CMakeLists.txt) file
- [Configuration](https://github.com/KumarjitDas/Align-Memory/tree/v0.3.0/Configuration) directory
  - A [Configuration](https://github.com/KumarjitDas/Align-Memory/blob/v0.3.0/Configuration/configure_version.h.in)
    file for project version header

## [0.2.0](https://github.com/KumarjitDas/Align-Memory/compare/v0.1.0...v0.2.0) - 2021-08-12

### Added

- More compiler warning options in
  [set_compiler_warnings.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.2.0/CMake/set_compiler_warnings.cmake)
  file
- [utility.h](https://github.com/KumarjitDas/Align-Memory/blob/v0.2.0/Sources/src/align_memory/utility.h) file in
  [src/align_memory](https://github.com/KumarjitDas/Align-Memory/blob/v0.2.0/Sources/src/align_memory)
- API function declarations in
  [align_memory.h](https://github.com/KumarjitDas/Align-Memory/blob/v0.2.0/Sources/include/align_memory/align_memory.h)
  file
- API function definitions in
  [align_memory.c](https://github.com/KumarjitDas/Align-Memory/blob/v0.2.0/Sources/src/align_memory/align_memory.c)
  file
- Changelogs till *v0.1.0* in [Changelog](https://github.com/KumarjitDas/Align-Memory/blob/v0.2.0/CHANGELOG.md) file
- [include_tests.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.2.0/CMake/include_tests.cmake) file
- Updated [Readme](https://github.com/KumarjitDas/Align-Memory/blob/v0.2.0/README.md) file
- New tests in [Tests](https://github.com/KumarjitDas/Align-Memory/tree/v0.2.0/Tests) directory
  - [kdi_align_memory_get_allocation_size.c](https://github.com/KumarjitDas/Align-Memory/blob/v0.2.0/Tests/kdi_align_memory_get_allocation_size.c)
    test file
  - [kdi_align_memory_get_aligned_address.c](https://github.com/KumarjitDas/Align-Memory/blob/v0.2.0/Tests/kdi_align_memory_get_aligned_address.c)
    test file
  - [kdi_align_memory_get_actual_address.c](https://github.com/KumarjitDas/Align-Memory/blob/v0.2.0/Tests/kdi_align_memory_get_actual_address.c)
    test file
- [Examples](https://github.com/KumarjitDas/Align-Memory/tree/v0.2.0/Examples) directory
  - [CMake](https://github.com/KumarjitDas/Align-Memory/blob/v0.2.0/Examples/CMakeLists.txt) file
  - [ex001.c](https://github.com/KumarjitDas/Align-Memory/blob/v0.2.0/Examples/ex001.c) example file

## [0.1.0](https://github.com/KumarjitDas/Align-Memory/releases/tag/v0.1.0) - 2021-08-12

### Added

- [Git Attributes](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/.gitattributes) file
- [Git Ignore](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/.gitignore) file
- [Changelog](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/CHANGELOG.md) file
- [License](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/LICENSE.txt) file
- [Readme](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/README.md) file
- [CMake](https://github.com/KumarjitDas/Align-Memory/tree/v0.1.0/CMake) directory
  - [add_sources_to_target.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/CMake/add_sources_to_target.cmake)
  - [create_library.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/CMake/create_library.cmake)
  - [generate_export_header.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/CMake/generate_export_header.cmake)
  - [set_build_output_directories.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/CMake/set_build_output_directories.cmake)
  - [set_build_postfixes.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/CMake/set_build_postfixes.cmake)
  - [set_c_standard.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/CMake/set_c_standard.cmake)
  - [set_compiler_warnings.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/CMake/set_compiler_warnings.cmake)
  - [set_include_directories.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/CMake/set_include_directories.cmake)
  - [validate_build_config.cmake](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/CMake/validate_build_config.cmake)
- Root [CMake](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/CMakeLists.txt) file
- [Sources](https://github.com/KumarjitDas/Align-Memory/tree/v0.1.0/Sources) directory
  - [include](https://github.com/KumarjitDas/Align-Memory/tree/v0.1.0/Sources/include) subdirectory
    - [align_memory](https://github.com/KumarjitDas/Align-Memory/tree/v0.1.0/Sources/include/align_memory) subdirectory
      - [align_memory.h](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/Sources/include/align_memory/align_memory.h)
        file
  - [src](https://github.com/KumarjitDas/Align-Memory/tree/v0.1.0/Sources/src) subdirectory
    - [align_memory](https://github.com/KumarjitDas/Align-Memory/tree/v0.1.0/Sources/src/align_memory) subdirectory
      - [align_memory.c](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/Sources/src/align_memory/align_memory.c)
        file
- [Tests](https://github.com/KumarjitDas/Align-Memory/tree/v0.1.0/Tests) directory
  - [CMake](https://github.com/KumarjitDas/Align-Memory/blob/v0.1.0/Tests/CMakeLists.txt) file
