#!/bin/bash
# --- XXAPK MAIN MANAGER v7.5 ---
# COMPATIBLE WITH CUSTOM STORE v4.0

R='\033[1;31m'; G='\033[1;32m'; W='\033[1;37m'; N='\033[0m'

# التأكد من وجود مجلد الحفظ الموحد
mkdir -p xxapk

show_logo() {
    clear
    echo -e "${R}"
    echo "  __  __  __  __      _     ____    _  __"
    echo "  \ \/ /  \ \/ /     / \   |  _ \  | |/ /"
    echo "   \  /    \  /     / _ \  | |_) | | ' / "
    echo "   /  \    /  \    / ___ \ |  __/  | . \ "
    echo "  /_/\_\  /_/\_\  /_/   \_\|_|     |_|\_\\"
    echo -e "  [+---------------------------------------+]"
    echo -e "  [   COMPATIBLE MODE | STORAGE: /xxapk    ]"
    echo -e "  [+---------------------------------------+]"
    echo -e "${N}"
}

while true; do
    show_logo
    echo -e "${W}[1] APP STORE (Customizable Ready Apps)${N}"
    echo -e "${W}[2] FULL CUSTOM BUILDER (Your Own Files)${N}"
    echo -e "${W}[3] VIEW XXAPK STORAGE (Filtered)${N}"
    echo -e "${W}[0] EXIT${N}"
    
    echo -en "\n${R}XXAPK >> ${N}"
    read opt

    case $opt in
        1)
            # التأكد من وجود ملف المتجر قبل التشغيل
            if [ -f "store.sh" ]; then
                bash store.sh
            else
                show_logo
                echo -e "${R}[!] Error: store.sh not found in directory.${N}"
                echo -e "${W}[*] Please download store.sh to use the store.${N}"
                sleep 3
            fi ;;
            
        2)
            show_logo
            echo -e "${R}--- FULL CUSTOM BUILD ---${N}"
            echo -en "${W}[?] Choose APK Name: ${N}"; read n
            echo -en "${W}[?] Folder Path of Files: ${N}"; read p
            
            if [ -d "$p" ]; then
                echo -en "${W}[?] Icon Image URL: ${N}"; read img
                show_logo
                echo -e "${G}[*] Building your custom APK...${N}"
                
                # تحميل الصورة وبناء التطبيق
                mkdir -p build_temp
                cp -r "$p"/* build_temp/
                curl -s -L "$img" -o "build_temp/icon.png"
                
                zip -rj "xxapk/${n}.apk" build_temp/ > /dev/null 2>&1
                rm -rf build_temp
                
                echo -e "\n${G}[SUCCESS] Saved to: xxapk/${n}.apk${N}"
                sleep 2
            else
                echo -e "${R}[!] Folder not found!${N}"; sleep 2
            fi ;;
            
        3)
            show_logo
            echo -e "${W}--- FILTERED APK STORAGE (.apk) ---${N}"
            echo -e "${G}Size   |   File Name${N}"
            echo -e "${W}-----------------------------------${N}"
            # عرض الملفات داخل فولدر xxapk فقط
            ls -lh xxapk/ 2>/dev/null | grep ".apk" | awk '{print $5 "  |  " $9}' || echo -e "${R}Storage is empty.${N}"
            echo -e "${W}-----------------------------------${N}"
            echo -e "\n${G}Total APKS: $(ls xxapk/*.apk 2>/dev/null | wc -l)${N}"
            echo -e "${W}Press Enter to go back...${N}"; read ;;
            
        0) clear; exit ;;
        *) echo -e "${R}Invalid Option!${N}"; sleep 1 ;;
    esac
done
