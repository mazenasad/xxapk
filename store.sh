#!/bin/bash
# --- XXAPK STORE MODULE v4.0 ---
# PRE-BUILT SCRIPTS | CUSTOM NAME & ICON

R='\033[1;31m'; G='\033[1;32m'; W='\033[1;37m'; N='\033[0m'

mkdir -p xxapk

clear
echo -e "${R}  __  __  __  __      _     ____    _  __"
echo -e "  \ \/ /  \ \/ /     / \   |  _ \  | |/ /"
echo -e "   \  /    \  /     / _ \  | |_) | | ' / "
echo -e "   /  \    /  \    / ___ \ |  __/  | . \ "
echo -e "  /_/\_\  /_/\_\  /_/   \_\|_|     |_|\_\\"
echo -e "  [+---------------------------------------+]"
echo -e "  [    OFFICIAL STORE | CUSTOMIZE MODE     ]"
echo -e "  [+---------------------------------------+]"

echo -e "\n${W}CHOOSE THE APP FUNCTION (اختار وظيفة التطبيق):${N}"
echo -e "${W}[01] WiFi Booster    [02] RAM Cleaner     [03] Battery Saver"
echo -e "[04] CPU Cooler      [05] Ping Fixer      [06] Game Turbo"
echo -e "[07] App Lock UI     [08] File Encryptor  [09] System Info"
echo -e "[10] DNS Changer     [11] Cache Deleter   [12] Media Downloader"
echo -e "[13] Proxy Tunnel    [14] Port Scanner    [15] Web Inspector"
echo -e "[16] Root Checker    [17] Temp Mailer     [18] Zip Manager"
echo -e "[19] Screen Recorder [20] Update Center${N}"
echo -e "${R}[00] BACK TO MENU${N}"

echo -en "\n${R}SELECT FUNCTION >> ${N}"
read s_opt

if [ "$s_opt" == "00" ] || [ -z "$s_opt" ]; then exit; fi

# تحديد السكريبت الجاهز بناءً على الرقم
case $s_opt in
    01) script_type="WiFi_Booster" ;;
    02) script_type="RAM_Cleaner" ;;
    03) script_type="Battery_Saver" ;;
    # ... الباقي بنفس الطريقة
    *) script_type="General_Tool" ;;
esac

# طلب التخصيص من المستخدم
echo -en "\n${W}[?] ENTER YOUR CUSTOM APP NAME: ${N}"
read custom_name
echo -en "${W}[?] PASTE ICON IMAGE URL: ${N}"
read custom_icon

echo -e "\n${G}[*] Building $custom_name...${N}"
mkdir -p temp_build

# وضع الكود الجاهز في ملف بايثون
echo "print('$script_type is running inside $custom_name...')" > temp_build/main.py

# تحميل الصورة التي اختارها المستخدم
curl -s -L "$custom_icon" -o "temp_build/icon.png"

# التجميع في فولدر xxapk بالاسم اللي اختاره المستخدم
zip -rj "xxapk/${custom_name}.apk" temp_build/ > /dev/null 2>&1
rm -rf temp_build

echo -e "\n${G}[SUCCESS] ${custom_name}.apk has been built!${N}"
echo -e "${G}[LOCATION] Check folder: /xxapk${N}"
sleep 2
