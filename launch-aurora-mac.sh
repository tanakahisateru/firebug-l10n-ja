#!/bin/sh
cp -f ja-JP/* firebug/extension/locale/ja-JP
echo "`pwd`/firebug/extension" > profile/extensions/firebug@software.joehewitt.com
/Applications/FirefoxAurora.app/Contents/MacOS/firefox -profile "`pwd`/profile" -no-remote
pushd .
cd firebug
git checkout -- extension/locale/ja-JP/*
popd

