@echo off

setlocal enableextensions

cd /d "%~dp0"

:: setup

if "%ProgramFiles(x86)%"=="" (
    set FIREFOX="%ProgramFiles%\Mozilla Firefox\firefox.exe"
) else (
    set FIREFOX="%ProgramFiles(x86)%\Mozilla Firefox\firefox.exe"
)
set FIREFOX_OPTS=-no-remote -UILocale ja-JP -contentLocale ja-JP

set ADDON=firebug@software.joehewitt.com

:: install extension

if not exist "profile\extensions\%ADDON%" (

    if not exist "profile\extensions" (
        mkdir "profile\extensions"
    )
    echo %~dp0firebug\extension\>"profile\extensions\%ADDON%"

    set FIREFOX_OPTS=%FIREFOX_OPTS% -url "about:newaddon?id=%ADDON%" "about:home"

)

:: launch

copy /b /y ja-JP\* firebug\extension\locale\ja-JP\

%FIREFOX% %FIREFOX_OPTS% -profile "%~dp0profile"

pushd firebug
    git clean -f -- extension\locale\ja-JP\*
    git checkout -- extension\locale\ja-JP\*
popd
