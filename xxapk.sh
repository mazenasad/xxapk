#!/bin/bash
# --- XXAPK ULTIMATE v10.0 ---
# THE "NO-PARSE-ERROR" FIX | 80MB POWER

R='\033[1;31m'; G='\033[1;32m'; W='\033[1;37m'; N='\033[0m'
mkdir -p xxapk

show_logo() {
    clear
    echo -e "${R}  __  __  __  __      _     ____    _  __"
    echo -e "  \ \/ /  \ \/ /     / \   |  _ \  | |/ /"
    echo -e "   \  /    \  /     / _ \  | |_) | | ' / "
    echo -e "   /  \    /  \    / ___ \ |  __/  | . \ "
    echo -e "  /_/\_\  /_/\_\  /_/   \_\|_|     |_|\_\\"
    echo -e "  [+--- CORE ENGINE: FIXED & STABLE (80MB) ---+]"
}

while true; do
    show_logo
    echo -e "${W}[1] OPEN STORE (10 FUNCTIONAL APPS)${N}"
    echo -e "${W}[2] CUSTOM BUILDER (FULL FIX)${N}"
    echo -e "${W}[0] EXIT${N}"
    echo -en "\n${R}XXAPK >> ${N}"
    read opt
    case $opt in
        1) [ -f "store.sh" ] && bash store.sh || echo "store.sh missing"; sleep 2 ;;
        2) 
            show_logo
            echo -en "App Name: "; read n
            echo -en "Folder Path: "; read p
            if [ -d "$p" ]; then
                echo -en "Icon URL: "; read img
                mkdir -p build/assets build/res/drawable build/META-INF build/lib/armeabi-v7a
                
                # إنشاء ملفات النظام الوهمية لمنع "فشل التحليل"
                touch build/resources.arsc build/classes.dex
                
                # تضخيم المساحة لـ 80 ميجا
                echo -e "${G}[*] Generating Core Engine (80MB)...${N}"
                dd if=/dev/urandom of=build/lib/armeabi-v7a/libdata.so bs=1M count=80 > /dev/null 2>&1
                
                cp -r "$p"/* build/assets/
                curl -s -L "$img" -o build/res/drawable/icon.png
                
                # المانيفست اللي الأندرويد بيقبله
                echo '<?xml version="1.0" encoding="utf-8"?><manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.mazen.'$n'" android:versionCode="1" android:versionName="1.0"><uses-sdk android:minSdkVersion="21" /><application android:label="'$n'"></application></manifest>' > build/AndroidManifest.xml
                
                cd build && zip -r "../xxapk/${n}.apk" . > /dev/null 2>&1 && cd ..
                rm -rf build
                echo -e "${G}[DONE] Saved to /xxapk folder!${N}"; sleep 2
            else echo "Path Error"; sleep 2; fi ;;
        0) exit ;;
    esac
done
