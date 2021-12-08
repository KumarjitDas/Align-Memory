# Align-Memory

A simple C library for easy memory alignment.

## Table of Contents

- [Align-Memory](#align-memory)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Installation](#installation)
  - [Roadmap](#roadmap)
  - [Contributing](#contributing)
  - [Naming Convension](#naming-convension)
  - [License](#license)
  - [Project Status](#project-status)
  - [Acknowledgment](#acknowledgment)
  - [Contact](#contact)
  - [Versioning](#versioning)
  - [Changelog](#changelog)

## Description

This is a simple dynamic memory-alignment C library. It contains convenience functions for *getting aligned-memory
allocation size*, *aligned-memory location*, and *actual memory location from aligned-memory*.

See the list of features and functions implemented till now in [Project Status](#project-status).

## Installation

To get started with this project, download and install the following.

- Download and install **git**
  - If you use *Windows*, then go to [this link](https://git-scm.com/downloads) and download and install the suitable
    version.
  - If you use any stable version of *Debian/Ubuntu* then run this command in your terminal

    ```sh
    sudo apt-get install git
    ```

  - If you use *macOS* then install [homebrew](https://brew.sh/) if you don't already have it, then run this command
    in your terminal

    ```sh
    brew install git
    ```

- Run the command to clone this repository

  ```sh
  git clone https://github.com/KumarjitDas/Align-Memory.git
  ```

- Download and install a **C** compiler (*clang* or *gcc*)
  - If you use *Windows 10* then download and install a suitable version of **clang** from
    [this](https://releases.llvm.org/download.html) link. For **gcc**, use the suitable *MinGW* version from
    [this](http://mingw-w64.org/doku.php/download) link.
  - If you use any stable version of *Debian/Ubuntu* then run these commands in your terminal to download and install
    **clang** and **gcc** compilers

    ```sh
    sudo apt install clang
    ```

    ```sh
    sudo apt install gcc
    ```

  - In *macOS*, **clang** is the default **C** compiler. To download and install gcc, run this command in your terminal

    ```sh
    brew install gcc
    ```

- Download and install **Ninja** build system
  - If you use *Windows 10* then download and install **Ninja** from
    [here](https://github.com/ninja-build/ninja/releases).
  - If you use any stable version of *Debian/Ubuntu* then run this command in your terminal

    ```sh
    sudo apt-get install ninja-build
    ```

  - If you use *macOS* then run this command in your terminal

    ```sh
    brew install ninja
    ```

- Download and install **CMake** build automation tool
  - If you use *Windows 10* then download and install **CMake** from [here](https://cmake.org/download/).
  - If you use any stable version of *Debian/Ubuntu* then run this command in your terminal

    ```sh
    sudo apt-get -y install cmake
    ```

  - If you use *macOS* then run this command in your terminal

    ```sh
    brew install cmake
    ```

## Roadmap

See the [open issues](https://github.com/KumarjitDas/Align-Memory/issues) for a list of proposed
features/functionalities (and known issues).

The list of features and functions implemented till now is given in [Project Status](#project-status).

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any
contributions you make are greatly appreciated.

- Fork this Project
- Create your *Feature Branch*

  ```sh
  git checkout -b feature/AmazingFeature
  ```

- Commit your *Changes*

  ```sh
  git commit -m 'Add some AmazingFeature'
  ```

- Push to the Branch

  ```sh
  git push origin feature/AmazingFeature
  ```

- Create a *Pull Request*

## Naming Convension

The naming convension used in this project will be listed soon.

## License

This project is distributed under the **MIT License**. See [LICENSE](LICENSE) for more information.

## Project Status

List of functionalities/features implemented so far.

- *kdi_get_size_for_memory_alignment*
- *kdi_align_memory*
- *kdi_get_actual_memory_from_aligned_memory*

## Acknowledgment

I appreciate these websites which helped me to make such good **README** file, and helped me to learn about project
versioning and keeping **CHANGELOG**.

- [Make a README](https://www.makeareadme.com/)
- [Semantic Versioning](https://semver.org/spec/v2.0.0.html)
- [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## Contact

Twitter: [@kumarjitdas1999](https://twitter.com/kumarjitdas1999)

LinkedIn:
[Kumarjit Das | কুমারজিৎ দাস](https://www.linkedin.com/in/kumarjit-das/)

E-mail: [kumarjitdas1999@gmail.com](kumarjitdas1999@gmail.com)

Project link:
[GitHub-KumarjitDas-Align-Memory](https://github.com/KumarjitDas/Align-Memory)

## Versioning

This project uses **MAJOR**, **MINOR**, and **PATCH** version numbers for
versioning (v*MAJOR.MINOR.PATCH*).

- **MAJOR** version number indicates *new changes which may be incompatible with older versions*.
- **MINOR** version number indicates *addition of backwards-compatible features*.
- **PATCH** version number indicates *backwards-compatible bug fixes*, or minor mistake fixes like *spelling*,
  *character cases*, *punctuations*, and *indentation*.

## Changelog

The [Changelog](CHANGELOG.md) file contains all the information about the changes made to this project till now.
