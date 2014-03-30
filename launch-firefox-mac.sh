#!/bin/sh
cp -f ja-JP/* firebug/extension/locale/ja-JP
echo "`pwd`/firebug/extension" > profile/extensions/firebug@software.joehewitt.com
/Applications/Firefox.app/Contents/MacOS/firefox -profile "`pwd`/profile" -no-remote
pushd .
cd firebug
git clean -f -- extension/locale/ja-JP/*
git checkout -- extension/locale/ja-JP/*
popd

