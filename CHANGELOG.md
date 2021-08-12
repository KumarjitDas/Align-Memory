# Align-Memory Changelog

All notable changes to this project will be documented in this file.

The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.0.1/), and this project
adheres to [Semantic Versioning](https://semver.org/spec/v2.0.1.html).

## [Unreleased]

- Examples
- Documentations
- Packages using *NSIS* and *vcpkg*

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

[Unreleased]: https://github.com/KumarjitDas/Align-Memory/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/KumarjitDas/Align-Memory/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/KumarjitDas/Align-Memory/releases/tag/v0.1.0
