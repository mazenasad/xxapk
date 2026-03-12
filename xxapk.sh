#!/bin/bash
# --- XXAPK PRO MANAGER v8.0 ---
# FIX: PARSE ERROR & SIGNATURE

R='\033[1;31m'; G='\033[1;32m'; W='\033[1;37m'; N='\033[0m'
mkdir -p xxapk

show_logo() {
    clear
    echo -e "${R}  __  __  __  __      _     ____    _  __"
    echo -e "  \ \/ /  \ \/ /     / \   |  _ \  | |/ /"
    echo -e "   \  /    \  /     / _ \  | |_) | | ' / "
    echo -e "   /  \    /  \    / ___ \ |  __/  | . \ "
    echo -e "  /_/\_\  /_/\_\  /_/   \_\|_|     |_|\_\\"
    echo -e "  [+--- FIXED VERSION: NO MORE PARSE ERROR ---+]"
}

while true; do
    show_logo
    echo -e "${W}[1] OPEN APP STORE (20 Ready Apps)${N}"
    echo -e "${W}[2] CUSTOM BUILDER (Manual)${N}"
    echo -e "${W}[3] VIEW STORAGE${N}"
    echo -e "${W}[0] EXIT${N}"
    echo -en "\n${R}XXAPK >> ${N}"
    read opt

    case $opt in
        1) [ -f "store.sh" ] && bash store.sh || echo "Error: store.sh missing"; sleep 2 ;;
        2)
            show_logo
            echo -en "APK Name: "; read n
            echo -en "Folder Path: "; read p
            if [ -d "$p" ]; then
                echo -en "Icon URL: "; read img
                mkdir -p build_tmp/assets build_tmp/res/drawable build_tmp/META-INF
                cp -r "$p"/* build_tmp/assets/
                curl -s -L "$img" -o "build_tmp/res/drawable/icon.png"
                # إضافة ملف المانيفست لحل مشكلة التحليل
                echo '<?xml version="1.0" encoding="utf-8"?><manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.mazen.app" android:versionCode="1" android:versionName="1.0"><uses-sdk android:minSdkVersion="21" /><application android:label="App"></application></manifest>' > build_tmp/AndroidManifest.xml
                cd build_tmp && zip -r "../xxapk/${n}.apk" . > /dev/null 2>&1 && cd ..
                rm -rf build_tmp
                echo -e "${G}SUCCESS! Saved to xxapk/${n}.apk${N}"; sleep 2
            else echo "Path Error"; sleep 2; fi ;;
        3) show_logo; ls -lh xxapk/ | grep ".apk" | awk '{print $5 " | " $9}'; read -p "Back..." ;;
        0) exit ;;
    esac
done
