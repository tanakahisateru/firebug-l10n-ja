@echo off

setlocal enableextensions

cd /d "%~dp0"

:: setup

if "%ProgramFiles(x86)%"=="" (
    set AURORA="%ProgramFiles%\Aurora\firefox.exe"
) else (
    set AURORA="%ProgramFiles(x86)%\Aurora\firefox.exe"
)
set AURORA_OPTS=-no-remote -UILocale ja-JP -contentLocale ja-JP

set ADDON=firebug@software.joehewitt.com

:: install extension

if not exist "profile\extensions\%ADDON%" (

    if not exist "profile\extensions" (
        mkdir "profile\extensions"
    )
    echo %~dp0firebug\extension\>"profile\extensions\%ADDON%"

    set AURORA_OPTS=%AURORA_OPTS% -url "about:newaddon?id=%ADDON%" "about:home"

)

:: launch

copy /b /y ja-JP\* firebug\extension\locale\ja-JP\

%AURORA% %AURORA_OPTS% -profile "%~dp0profile"

pushd firebug
    git checkout -- extension\locale\ja-JP\*
    git clean -f -- extension\locale\ja-JP\*
popd
