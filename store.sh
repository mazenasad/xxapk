#!/bin/bash
# --- XXAPK STORE v5.0 (20 APPS) ---
R='\033[1;31m'; G='\033[1;32m'; W='\033[1;37m'; N='\033[0m'

clear
echo -e "${R}--- XXAPK STORE (SELECT FUNCTION) ---${N}"
echo -e "${W}[01] WiFi Booster    [02] RAM Cleaner     [03] Battery Saver"
echo -e "[04] CPU Cooler      [05] Ping Fixer      [06] Game Turbo"
echo -e "[07] App Lock        [08] File Encrypt    [09] System Info"
echo -e "[10] DNS Changer     [11] Cache Deleter   [12] Media Downloader"
echo -e "[13] Proxy Tunnel    [14] Port Scanner    [15] Web Inspector"
echo -e "[16] Root Checker    [17] Temp Mailer     [18] Zip Manager"
echo -e "[19] Screen Rec      [20] Update Center${N}"

echo -en "\n${R}SELECT FUNCTION >> ${N}"
read s_opt
[ "$s_opt" == "00" ] && exit

echo -en "${W}Enter App Name: ${N}"; read c_name
echo -en "${W}Paste Icon URL: ${N}"; read c_icon

echo -e "${G}[*] Building $c_name...${N}"
mkdir -p build_tmp/assets build_tmp/res/drawable build_tmp/META-INF

# كود التطبيق المختار (بايثون)
echo "print('Function $s_opt Active')" > build_tmp/assets/main.py

# تحميل الأيقونة
curl -s -L "$c_icon" -o "build_tmp/res/drawable/icon.png"

# المانيفست الأساسي لمنع الخطأ
echo '<?xml version="1.0" encoding="utf-8"?><manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.mazen.'$s_opt'" android:versionCode="1" android:versionName="1.0"><uses-sdk android:minSdkVersion="21" /></manifest>' > build_tmp/AndroidManifest.xml

# التجميع
cd build_tmp && zip -r "../xxapk/${c_name}.apk" . > /dev/null 2>&1 && cd ..
rm -rf build_tmp

echo -e "${G}Done! File in /xxapk${N}"
sleep 2
