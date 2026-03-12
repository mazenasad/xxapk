#!/bin/bash
# --- XXAPK HEAVY STORE (10 APPS) ---
R='\033[1;31m'; G='\033[1;32m'; W='\033[1;37m'; N='\033[0m'

clear
echo -e "${R}--- XXAPK HEAVY STORE (10 POWERFUL APPS) ---${N}"
echo -e "${W}[01] WiFi Ultra Booster   [06] Proxy Tunnel Pro"
echo -e "[02] RAM Super Cleaner   [07] Port Scanner X"
echo -e "[03] Battery Max Saver   [08] Media Downloader"
echo -e "[04] CPU Turbo Cooler   [09] Game Optimizer"
echo -e "[05] DNS Pro Changer    [10] System Fixer v9"

echo -en "\n${R}SELECT >> ${N}"
read s_opt
echo -en "${W}App Name: ${N}"; read c_name
echo -en "${W}Icon URL: ${N}"; read c_icon

echo -e "${G}[*] Building Heavy 80MB Package...${N}"
mkdir -p build_tmp/assets build_tmp/lib build_tmp/META-INF

# إضافة ملف بايثون ضخم ومعقد (محاكاة)
cat << 'EOF' > build_tmp/assets/main.py
import socket, os, time, random
# Complex code structure to prevent light detection
def start_engine():
    for i in range(500):
        data = random.getrandbits(128)
        print(f"Optimizing Sector {i}...")
start_engine()
EOF

# توليد ملف الـ 80 ميجا لزيادة المساحة فعلياً
dd if=/dev/urandom of=build_tmp/lib/libcore_engine.so bs=1M count=80 > /dev/null 2>&1
curl -s -L "$c_icon" -o "build_tmp/icon.png"

# المانيفست الاحترافي
echo '<?xml version="1.0" encoding="utf-8"?><manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.mazen.store.'$s_opt'" android:versionCode="1" android:versionName="1.0"><uses-sdk android:minSdkVersion="21" /></manifest>' > build_tmp/AndroidManifest.xml

cd build_tmp && zip -r "../xxapk/${c_name}.apk" . > /dev/null 2>&1 && cd ..
rm -rf build_tmp
echo -e "${G}[DONE] 80MB APK SAVED TO /xxapk${N}"
sleep 2
