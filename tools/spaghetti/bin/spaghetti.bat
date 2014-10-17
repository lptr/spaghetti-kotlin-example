@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  spaghetti startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

@rem Add default JVM options here. You can also use JAVA_OPTS and SPAGHETTI_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windowz variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if "%@eval[2+2]" == "4" goto 4NT_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
goto execute

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\spaghetti-2.0-51-gcbad234.jar;%APP_HOME%\lib\spaghetti-core-2.0-51-gcbad234.jar;%APP_HOME%\lib\airline-0.6.jar;%APP_HOME%\lib\logback-classic-1.1.2.jar;%APP_HOME%\lib\spaghetti-haxe-support-2.0-51-gcbad234.jar;%APP_HOME%\lib\spaghetti-js-support-2.0-51-gcbad234.jar;%APP_HOME%\lib\spaghetti-kotlin-support-2.0-51-gcbad234.jar;%APP_HOME%\lib\spaghetti-typescript-support-2.0-51-gcbad234.jar;%APP_HOME%\lib\closure-compiler-v20140814.jar;%APP_HOME%\lib\antlr4-runtime-4.2.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\commons-codec-1.9.jar;%APP_HOME%\lib\commons-io-2.4.jar;%APP_HOME%\lib\guava-17.0.jar;%APP_HOME%\lib\gson-2.2.4.jar;%APP_HOME%\lib\slf4j-api-1.7.7.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\logback-core-1.1.2.jar;%APP_HOME%\lib\groovy-2.3.6.jar;%APP_HOME%\lib\closure-compiler-externs-v20140814.jar;%APP_HOME%\lib\args4j-2.0.26.jar;%APP_HOME%\lib\protobuf-java-2.5.0.jar;%APP_HOME%\lib\json-20090211.jar;%APP_HOME%\lib\jsr305-1.3.9.jar;%APP_HOME%\lib\org.abego.treelayout.core-1.0.1.jar;%APP_HOME%\lib\antlr4-annotations-4.2.jar

@rem Execute spaghetti
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %SPAGHETTI_OPTS%  -classpath "%CLASSPATH%" com.prezi.spaghetti.cli.SpaghettiCli %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable SPAGHETTI_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%SPAGHETTI_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
