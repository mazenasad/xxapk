#!/bin/bash

# --- XXAPK AUTO-BUILDER v3.5 ---
# MODE: FOLDER SCANNER | BY MAZEN

R='\033[1;31m'
W='\033[1;37m'
G='\033[1;30m'
N='\033[0m'

show_logo() {
    clear
    echo -e "${R}"
    echo "  ██╗  ██╗██╗  ██╗ █████╗ ██████╗ ██╗  ██╗"
    echo "  ╚██╗██╔╝╚██╗██╔╝██╔══██╗██╔══██╗██║ ██╔╝"
    echo "   ╚███╔╝  ╚███╔╝ ███████║██████╔╝█████╔╝ "
    echo "   ██╔██╗  ██╔██╗ ██╔══██║██╔═══╝ ██╔═██╗ "
    echo "  ██╔╝ ██╗██╔╝ ██╗██║  ██║██║     ██║  ██╗"
    echo "  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝"
    echo -e "  [+---------------------------------------+]"
    echo -e "  [  AUTO-SCANNER ENGINE | VERSION 3.5     ]"
    echo -e "  [+---------------------------------------+]"
    echo -e "${N}"
}

while true; do
    show_logo
    echo -e "${W}[1]${N} ${R}SHOW APKS${N}"
    echo -e "${W}[2]${N} ${R}BUILD FROM FOLDER (Auto Scan)${N}"
    echo -e "${W}[0]${N} ${W}EXIT${N}"
    echo -en "\n${R}XXAPK >> ${N}"
    read opt

    case $opt in
        1)
            show_logo
            echo -e "${W}--- GENERATED APKS ---${N}"
            ls -h *.apk 2>/dev/null || echo -e "${G}No files found.${N}"
            echo -e "\n${G}Press Enter to return...${N}"
            read
            ;;
        2)
            show_logo
            echo -en "${W}[?] ENTER APK NAME: ${N}"
            read apk_name
            
            echo -en "${W}[?] ENTER FOLDER PATH (مسار المجلد): ${N}"
            read f_path
            
            if [ -d "$f_path" ]; then
                echo -en "${W}[?] ENTER ICON IMAGE URL (رابط الصورة): ${N}"
                read img_url
                
                show_logo
                echo -e "${R}[*] Scanning folder: $f_path...${N}"
                
                # تحميل الصورة من الرابط
                curl -s "$img_url" -o "icon.png"
                
                # تجميع الملفات أوتوماتيكياً
                echo -e "${G}[+] Found $(ls "$f_path" | wc -l) files. Compiling...${N}"
                zip -rj "${apk_name}.apk" "$f_path" "icon.png" > /dev/null 2>&1
                
                rm "icon.png" # تنظيف الصورة المؤقتة
                echo -e "\n${G}[SUCCESS] ${apk_name}.apk is ready!${N}"
            else
                echo -e "${R}[!] Error: Folder path not found!${N}"
            fi
            sleep 2
            ;;
        0) clear; exit ;;
    esac
done
