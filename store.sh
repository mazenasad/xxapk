#!/bin/bash
# --- XXAPK STORE MODULE v2.0 ---
R='\033[1;31m'; G='\033[1;32m'; W='\033[1;37m'; N='\033[0m'

clear
echo -e "${R}--- XXAPK OFFICIAL STORE (20 APPS) ---${N}"
echo -e "${W}[01] WiFi Booster    [02] RAM Cleaner     [03] Battery Saver"
echo -e "[04] CPU Cooler      [05] Ping Fixer      [06] Game Turbo"
echo -e "[07] App Lock UI     [08] File Encryptor  [09] System Info"
echo -e "[10] DNS Changer     [11] Cache Deleter   [12] Media Downloader"
echo -e "[13] Proxy Tunnel    [14] Port Scanner    [15] Web Inspector"
echo -e "[16] Root Checker    [17] Temp Mailer     [18] Zip Manager"
echo -e "[19] Screen Recorder [20] Update Center${N}"
echo -e "${R}[00] BACK TO MENU${N}"

echo -en "\n${R}CHOOSE APP NUMBER >> ${N}"
read s_opt

if [ "$s_opt" == "00" ] || [ -z "$s_opt" ]; then exit; fi

# تحديد اسم التطبيق بناءً على الرقم
case $s_opt in
    01) name="WiFi_Booster" ;; 02) name="RAM_Cleaner" ;; 03) name="Battery_Saver" ;;
    04) name="CPU_Cooler" ;; 05) name="Ping_Fixer" ;; 06) name="Game_Turbo" ;;
    07) name="App_Lock" ;; 08) name="File_Encrypt" ;; 09) name="System_Info" ;;
    10) name="DNS_Changer" ;; 11) name="Cache_Deleter" ;; 12) name="Media_Downloader" ;;
    13) name="Proxy_Tunnel" ;; 14) name="Port_Scanner" ;; 15) name="Web_Inspector" ;;
    16) name="Root_Checker" ;; 17) name="Temp_Mailer" ;; 18) name="Zip_Manager" ;;
    19) name="Screen_Rec" ;; 20) name="Update_Center" ;;
    *) echo "Invalid"; sleep 1; exit ;;
esac

echo -e "${G}[*] Building $name.apk...${N}"
mkdir -p temp_build
# كود بايثون بسيط داخل كل تطبيق ليعمل كـ Script
echo "print('$name System Active')" > temp_build/main.py

# الحفظ في المجلد الموحد
zip -rj "xxapk/${name}.apk" temp_build/ > /dev/null 2>&1
rm -rf temp_build

echo -e "${G}[SUCCESS] $name.apk is now in /xxapk folder!${N}"
sleep 2

