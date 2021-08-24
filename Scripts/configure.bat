@ECHO OFF
SETLOCAL
SETLOCAL ENABLEEXTENSIONS

cmake --version
IF %ERRORLEVEL% NEQ 0 (
    ECHO `cmake` is not in path or is not installed.
    EXIT /B 1
)
ninja --version
IF %ERRORLEVEL% NEQ 0 (
    ECHO `ninja` is not in path or is not installed.
    EXIT /B 1
)

SET srcdir=%~1
SET builddir=%~2
SET generator=%~3
SET compiler=%~4
SET shared=%~5
SET others=%~6

IF "%srcdir%"=="" (SET srcdir=.)
IF "%builddir%"=="" (SET builddir=Build)
IF "%generator%"=="" (SET generator="Ninja Multi-Config")
IF "%compiler%"=="" (SET compiler=clang)
IF "%shared%"=="" (SET shared=OFF)

SET generator=%generator:"=%

cmake -S %srcdir% -B %builddir% -G "%generator%" ^
      -D CMAKE_C_COMPILER=%compiler% -D BUILD_SHARED_LIBS=%shared%
      %others%
