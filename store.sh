#!/bin/bash
R='\033[1;31m'; G='\033[1;32m'; W='\033[1;37m'; N='\033[0m'
clear
echo -e "${R}--- XXAPK HEAVY STORE ---${N}"
echo -e "${W}[01] WiFi Booster    [06] Proxy Pro"
echo -e "[02] RAM Cleaner     [07] Port Scanner"
echo -e "[03] Battery Saver   [08] Video Downloader"
echo -e "[04] CPU Turbo       [09] Game Mode"
echo -e "[05] DNS Changer     [10] Root Checker"

echo -en "\n${R}SELECT >> ${N}"
read s_opt
echo -en "Choose Name: "; read c_name
echo -en "Icon Link: "; read c_icon

echo -e "${G}[*] Building... Please wait (80MB Generating)${N}"
mkdir -p build/assets build/lib/armeabi-v7a build/META-INF build/res/drawable

# إضافة كود بايثون ضخم (أكثر من 500 سطر وهمي)
echo "print('Starting Engine...')" > build/assets/main.py
for i in {1..500}; do echo "print('Loading Module $i...')" >> build/assets/main.py; done

# الملف الثقيل (80 ميجا)
dd if=/dev/urandom of=build/lib/armeabi-v7a/libengine.so bs=1M count=80 > /dev/null 2>&1
curl -s -L "$c_icon" -o build/res/drawable/icon.png
touch build/resources.arsc build/classes.dex
echo '<?xml version="1.0" encoding="utf-8"?><manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.mazen.store.'$s_opt'"><uses-sdk android:minSdkVersion="21" /></manifest>' > build/AndroidManifest.xml

cd build && zip -r "../xxapk/${c_name}.apk" . > /dev/null 2>&1 && cd ..
rm -rf build
echo -e "${G}[SUCCESS] APK Ready! Size: 80MB${N}"; sleep 2
