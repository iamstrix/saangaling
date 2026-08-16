#!/usr/bin/env bash
# Rebuild the Android debug APK after editing docs/play.html.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
cd "$HERE"

# JDK 21 from Android Studio — Gradle 8.14 does not support the system JDK 25
export JAVA_HOME="/c/Program Files/Android/Android Studio/jbr"
export ANDROID_HOME="C:/Users/Jose/AppData/Local/Android/Sdk"

cp ../docs/play.html www/index.html
npx cap sync android
cd android
./gradlew assembleDebug --no-daemon
cp app/build/outputs/apk/debug/app-debug.apk ../../saan-galing-debug.apk
echo "APK -> saan-galing-debug.apk"
