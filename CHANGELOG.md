# Align-Memory Changelog

All notable changes to this project will be documented in this file.

The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.0.1/), and this project
adheres to [Semantic Versioning](https://semver.org/spec/v2.0.1.html).

## [Unreleased]

## [0.1.0] - 2021-08-12

### Added

- [GitAttributes](.gitattributes) file
- [GinIgnore](.gitignore) file
- [Changelog](CHANGELOG.md) file
- [License](LICENSE) file
- [Readme](README.md) file
- [CMake](CMake/) directory
  - [add_sources_to_target](CMake/add_sources_to_target.cmake),
    [create_library](CMake/create_library.cmake),
    [generate_export_header](CMake/generate_export_header.cmake),
    [include_tests](CMake/include_tests.cmake),
    [set_build_output_directories](CMake/set_build_output_directories.cmake),
    [set_build_postfixes](CMake/set_build_postfixes.cmake),
    [set_c_standard](CMake/set_c_standard.cmake),
    [set_compiler_warnings](CMake/set_compiler_warnings.cmake),
    [set_include_directories](CMake/set_include_directories.cmake), and
    [validate_build_config](CMake/validate_build_config.cmake) files
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
- [Examples](Examples/) directory
  - [CMake](Examples/CMakeLists.txt) file
  - [ex001.c](Examples/ex001.c) example file

[Unreleased]: https://github.com/KumarjitDas/Memory/compare/v0.1.0...HEAD
<!-- [0.1.0]: https://github.com/KumarjitDas/Memory/compare/v0.1.0...v0.1.0 -->
[0.1.0]: https://github.com/KumarjitDas/Memory/releases/tag/v0.1.0
