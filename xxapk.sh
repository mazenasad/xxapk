#!/bin/bash
# --- XXAPK ULTIMATE v12.0 ---
# THE FINAL SIGNATURE ENGINE

R='\033[1;31m'; G='\033[1;32m'; W='\033[1;37m'; N='\033[0m'
mkdir -p xxapk

# تثبيت الأدوات الضرورية
if ! command -v apksigner &> /dev/null; then
    echo -e "${W}[*] Installing Build Tools...${N}"
    pkg install apksigner binutils -y > /dev/null 2>&1
fi

show_logo() {
    clear
    echo -e "${R}  __  __  __  __      _     ____    _  __"
    echo -e "  \ \/ /  \ \/ /     / \   |  _ \  | |/ /"
    echo -e "   \  /    \  /     / _ \  | |_) | | ' / "
    echo -e "   /  \    /  \    / ___ \ |  __/  | . \ "
    echo -e "  /_/\_\  /_/\_\  /_/   \_\|_|     |_|\_\\"
    echo -e "  [+--- 80MB SIGNED APK ENGINE ACTIVE ---+]"
}

while true; do
    show_logo
    echo -e "${W}[1] OPEN STORE (WiFi Scanner & More)${N}"
    echo -e "${W}[2] CUSTOM BUILD (Auto-Sign)${N}"
    echo -e "${W}[3] VIEW STORAGE${N}"
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
                mkdir -p build/assets build/lib/armeabi-v7a
                dd if=/dev/zero of=build/lib/armeabi-v7a/libengine.so bs=1M count=80 > /dev/null 2>&1
                cp -r "$p"/* build/assets/
                curl -s -L "$img" -o build/icon.png
                touch build/classes.dex build/resources.arsc
                echo '<?xml version="1.0" encoding="utf-8"?><manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.mazen.custom.'$n'"><uses-sdk android:minSdkVersion="21" /><application android:label="'$n'"></application></manifest>' > build/AndroidManifest.xml
                cd build && zip -r "../xxapk/tmp.apk" . > /dev/null 2>&1 && cd ..
                apksigner debug "xxapk/tmp.apk" "xxapk/${n}.apk" > /dev/null 2>&1
                rm -rf build "xxapk/tmp.apk"
                echo -e "${G}[DONE] Signed 80MB APK Created!${N}"; sleep 2
            else echo "Path Error"; sleep 2; fi ;;
        3) show_logo; ls -lh xxapk/ | grep ".apk" | awk '{print $5 " | " $9}'; read -p "Back..." ;;
        0) exit ;;
    esac
done
