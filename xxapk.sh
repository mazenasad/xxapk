#!/bin/bash

# --- XXAPK ORGANIZED EDITION v5.5 ---
# AUTO-SAVE TO 'output' FOLDER | BY MAZEN

R='\033[1;31m'
G='\033[1;32m'
W='\033[1;37m'
N='\033[0m'

# إنشاء فولدر المخرجات لو مش موجود
mkdir -p output

show_logo() {
    clear
    echo -e "${R}"
    echo "  __  __  __  __      _     ____    _  __"
    echo "  \ \/ /  \ \/ /     / \   |  _ \  | |/ /"
    echo "   \  /    \  /     / _ \  | |_) | | ' / "
    echo "   /  \    /  \    / ___ \ |  __/  | . \ "
    echo "  /_/\_\  /_/\_\  /_/   \_\|_|     |_|\_\\"
    echo -e "  [+---------------------------------------+]"
    echo -e "  [   ALL APKS SAVED TO: /output FOLDER    ]"
    echo -e "  [+---------------------------------------+]"
    echo -e "${N}"
}

while true; do
    show_logo
    echo -e "${W}[1]${N} ${R}OPEN APP STORE (Ready Apps)${N}"
    echo -e "${W}[2]${N} ${R}CUSTOM BUILD (Manual)${N}"
    echo -e "${W}[3]${N} ${G}OPEN OUTPUT FOLDER (عرض الملفات)${N}"
    echo -e "${W}[0]${N} ${W}EXIT${N}"
    
    echo -en "\n${R}XXAPK >> ${N}"
    read opt

    case $opt in
        1)
            show_logo
            echo -e "${W}--- SELECT PRE-BUILT APP ---${N}"
            echo -e "${R}[01] WiFi Speed Booster${N}"
            echo -e "${R}[02] RAM Cleaner Pro${N}"
            echo -en "\n${W}Choose App Number: ${N}"
            read app_num
            
            # محاكاة بناء التطبيق الجاهز ونقله للفولدر
            echo -e "${G}[*] Building App $app_num...${N}"
            sleep 1
            touch "output/App_${app_num}.apk" # تجربة إنشاء ملف
            echo -e "${G}[DONE] Saved to: output/App_${app_num}.apk${N}"
            sleep 2
            ;;
            
        2)
            show_logo
            echo -en "${W}[?] APK Name: ${N}"; read apk_name
            echo -en "${W}[?] Source Folder Path: ${N}"; read f_path
            
            if [ -d "$f_path" ]; then
                echo -en "${W}[?] Icon URL: ${N}"; read img_url
                curl -s -L "$img_url" -o "icon.png"
                
                # بناء التطبيق وحفظه مباشرة داخل فولدر output
                zip -rj "output/${apk_name}.apk" "$f_path" "icon.png" > /dev/null 2>&1
                
                rm "icon.png"
                echo -e "\n${G}[SUCCESS] Saved to: output/${apk_name}.apk${N}"
            else
                echo -e "${R}[!] Path not found!${N}"
            fi
            sleep 2
            ;;
            
        3)
            show_logo
            echo -e "${W}--- CURRENT APKS IN OUTPUT ---${N}"
            ls -h output/*.apk 2>/dev/null || echo -e "${R}No APKS yet.${N}"
            echo -e "\n${G}Press Enter to return...${N}"
            read
            ;;
            
        0) exit ;;
    esac
done
