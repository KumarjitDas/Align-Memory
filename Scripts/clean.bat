@REM
@REM @file clean.bat
@REM @author Kumarjit Das (kumarjitdas1999@gmail.com)
@REM @brief A batch script clean all the build outputs and CMake cache of this
@REM        project.
@REM @version 0.8.0
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

SET builddir=%~1

IF "%builddir%"=="" (SET builddir=Build)

IF EXIST "%builddir%\" (
    IF EXIST "%builddir%\CMakeCache.txt" (
        DEL /Q "%builddir%\CMakeCache.txt"
        ECHO [KDI Clean] CMake cache ^("%builddir%\CMakeCache.txt"^) deleted.
    )

    FOR %%a IN (bin lib Tests) DO (
        IF EXIST "%builddir%\%%a\" (
            FOR %%b IN (Debug Release MinSizeRel RelWithDebInfo) DO (
                IF EXIST "%builddir%\%%a\%%b\" (
                    FOR /F "delims=" %%c IN (
                        'DIR /B /S "%builddir%\%%a\%%b\"'
                    ) DO (
                        DEL /Q "%%c"
                        ECHO [KDI Clean] CMake output file, "%%c", deleted.
                    )
                )
            )
        )
    )
)
