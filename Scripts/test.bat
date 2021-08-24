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

SET config=%~1
SET parallel=%~2
SET builddir=%~3

IF "%config%"=="" (SET config=Debug)
IF "%parallel%"=="" (SET parallel=2)
IF "%builddir%"=="" (SET builddir=Build)

CD %builddir% & ctest --build-config %config% --parallel %parallel% & CD ..
