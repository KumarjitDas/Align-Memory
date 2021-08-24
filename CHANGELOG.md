# Align-Memory Changelog

All notable changes to this project will be documented in this file.

The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.0.1/), and this project
adheres to [Semantic Versioning](https://semver.org/spec/v2.0.1.html).

## [Unreleased]

- Examples
- *CPack* packaging support
- *vcpkg* packaging support

## [0.5.0] - 2021-08-24

### Added

- Install rule for version header and config/api header files in
  [configure_project_version.cmake](CMake/configure_project_version.cmake) and
  [generate_export_header.cmake](CMake/generate_export_header.cmake)
- Inclusion of **GNUInstallDirs** in
  [export_rules.cmake](CMake/export_rules.cmake)
- Inclusion of **CMakePackageConfigHelpers** in
  [package_configuration.cmake](CMake/package_configuration.cmake)
- Adding more compiler warning options for *Clang* and *GNU C* compilers in
  [set_compiler_warnings.cmake](CMake/set_compiler_warnings.cmake)
- [Scripts](Scripts/) directory for shell/batch scripts
  - CMake configure commands in [configure.bat](Scripts/configure.bat) script
    file
  - CMake build commands in [build.bat](Scripts/build.bat) script file
  - CTest commands in [test.bat](Scripts/test.bat) script file
- Copyright message in [root CMake file](CMakeLists.txt),
  [align_memory.h](Sources/include/align_memory/align_memory.h),
  [align_memory.c](Sources/src/align_memory/align_memory.c), and
  [utility.h](Sources/src/align_memory/utility.h) source files
- Documentation for api functions in
  [align_memory.h](Sources/include/align_memory/align_memory.h) file

### Changed

- Absolute names in [Config.cmake.in](Configuration/Config.cmake.in) file

### Removed

- Inclusion of **GNUInstallDirs** and **CMakePackageConfigHelpers** in root
  [CMake](CMakeLists.txt) file
- Unnecessary quotes in
  [set_include_directories.cmake](CMake/set_include_directories.cmake)

## [0.4.0] - 2021-08-16

### Added

- *___kdi_offset_t* type for offset types in
  [utility.h](Sources/src/align_memory/utility.h) file
- Compiler warnings for *MSVC*, *Clang*, and *GCC*
- Package configuration and version configuration files
- [Config.cmake.in](Configuration/Config.cmake.in) file in
  [Configuration](Configuration/) directory for the package configuration

### Changed

- Function definitions in
  [align_memory.c](Sources/src/align_memory/align_memory.c) file according to
  the new offset type
- Tests in [kdi_align_memory_get_allocation_size.c](Tests/kdi_align_memory_get_allocation_size.c)
  and [kdi_align_memory_get_aligned_address.c](Tests/kdi_align_memory_get_aligned_address.c)
  files according to the new offset type
- Version number to *0.4.0* in root [CMake](CMakeLists.txt) file

### Removed

- Unnecessary quotes from all standalone variables in all of the
  [CMake](CMake/) files

## [0.3.0] - 2021-08-13

### Added

- Status messages in all **CMake** files
- [setup_project.cmake](CMake/setup_project.cmake) and
  [configure_project_version.cmake](CMake/configure_project_version.cmake)
  files
- Seperate *PROJECT_NAME* and *LIBRARY_NAME* in root [CMake](CMakeLists.txt)
  file
- [Configuration](Configuration/) directory
  - A [Configuration](Configuration/configure_version.h.in) file for project
    version header

## [0.2.0] - 2021-08-12

### Added

- More compiler warning options in
  [set_compiler_warnings.cmake](CMake/set_compiler_warnings.cmake) file
- [utility.h](Sources/src/align_memory/utility.h) file in
  [src/align_memory](Sources/src/align_memory/)
- API function declarations in
  [align_memory.h](Sources/include/align_memory/align_memory.h) file
- API function definitions in
  [align_memory.c](Sources/src/align_memory/align_memory.h) file
- Changelogs till *v0.1.0* in [Changelog](CHANGELOG.md) file
- [include_tests.cmake](CMake/include_tests.cmake) file
- Updated [Readme](README.md) file
- New tests in [Tests](Tests/) directory
  - [kdi_align_memory_get_allocation_size.c](Tests/kdi_align_memory_get_allocation_size.c) test file
  - [kdi_align_memory_get_aligned_address.c](Tests/kdi_align_memory_get_aligned_address.c) test file
  - [kdi_align_memory_get_actual_address.c](Tests/kdi_align_memory_get_actual_address.c) test file
- [Examples](Examples/) directory
  - [CMake](Examples/CMakeLists.txt) file
  - [ex001.c](Examples/ex001.c) example file

## [0.1.0] - 2021-08-12

### Added

- [GitAttributes](.gitattributes) file
- [GinIgnore](.gitignore) file
- [Changelog](CHANGELOG.md) file
- [License](LICENSE) file
- [Readme](README.md) file
- [CMake](CMake/) directory
  - [add_sources_to_target.cmake](CMake/add_sources_to_target.cmake),
    [create_library.cmake](CMake/create_library.cmake),
    [generate_export_header.cmake](CMake/generate_export_header.cmake),
    [set_build_output_directories.cmake](CMake/set_build_output_directories.cmake),
    [set_build_postfixes.cmake](CMake/set_build_postfixes.cmake),
    [set_c_standard.cmake](CMake/set_c_standard.cmake),
    [set_compiler_warnings.cmake](CMake/set_compiler_warnings.cmake),
    [set_include_directories.cmake](CMake/set_include_directories.cmake), and
    [validate_build_config.cmake](CMake/validate_build_config.cmake) files
- Root [CMake](CMakeLists.txt) file
- [Sources](Sources/) directory
  - [include](Sources/include/) subdirectory
    - [align_memory](Sources/include/align_memory/) subdirectory
      - [align_memory.h](Sources/include/align_memory/align_memory.h) file
  - [src](Sources/src/) subdirectory
    - [align_memory](Sources/src/align_memory/) subdirectory
      - [align_memory.c](Sources/src/align_memory/align_memory.c) file
- [Tests](Tests/) directory
  - [CMake](Tests/CMakeLists.txt) file

[Unreleased]: https://github.com/KumarjitDas/Align-Memory/compare/v0.5.0...HEAD
[0.5.0]: https://github.com/KumarjitDas/Align-Memory/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/KumarjitDas/Align-Memory/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/KumarjitDas/Align-Memory/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/KumarjitDas/Align-Memory/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/KumarjitDas/Align-Memory/releases/tag/v0.1.0
