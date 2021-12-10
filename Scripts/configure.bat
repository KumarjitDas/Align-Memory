@REM
@REM @file configure.bat
@REM @author Kumarjit Das (kumarjitdas1999@gmail.com)
@REM @brief A batch script to configure this project using CMake.
@REM @version 0.9.0
@REM @date 2021-12-10
@REM
@REM @copyright Copyright (c) 2021
@REM
@REM License(MIT License):
@REM
@REM Copyright (c) 2021 Kumarjit Das | কুমারজিৎ দাস
@REM
@REM Permission is hereby granted, free of charge, to any person obtaining a
@REM copy
@REM of this software and associated documentation files (the "Software"), to
@REM deal in the Software without restriction, including without limitation the
@REM rights to use, copy, modify, merge, publish, distribute, sublicense, and/
@REM or sell copies of the Software, and to permit persons to whom the
@REM Software is furnished to do so, subject to the following conditions:
@REM
@REM The above copyright notice and this permission notice shall be included in
@REM all copies or substantial portions of the Software.
@REM
@REM THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
@REM IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
@REM FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
@REM THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
@REM LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
@REM FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
@REM DEALINGS IN THE SOFTWARE.
@REM

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

SET compiler=%~1
SET generator=%~2
SET shared=%~3
SET builddir=%~4

IF "%compiler%"=="" (
    SET compiler=clang
)
IF "%generator%"=="" (
    SET generator="Ninja Multi-Config"
)
IF "%shared%"=="" (
    SET shared=OFF
)
IF "%builddir%"=="" (
    SET builddir=Build
)

SET generator=%generator:"=%

CALL .\Scripts\clean.bat %builddir%

SET library=static
IF "%shared%"=="ON" (
    SET library=shared
)
ECHO [KDI Configure] Configuring %builddir% for %library% library...

cmake -S . -B %builddir% -G "%generator%" ^
-DCMAKE_C_COMPILER=%compiler% -DBUILD_SHARED_LIBS=%shared%
