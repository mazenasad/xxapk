#!/bin/bash
# --- XXAPK MAIN MANAGER v7.0 ---
# STORAGE: /xxapk | MODULAR DESIGN

R='\033[1;31m'; G='\033[1;32m'; W='\033[1;37m'; N='\033[0m'

# إنشاء مجلد الحفظ الموحد
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
    echo -e "  [   MAIN MANAGER | STORAGE: /xxapk       ]"
    echo -e "  [+---------------------------------------+]"
    echo -e "${N}"
}

while true; do
    show_logo
    echo -e "${W}[1] OPEN APP STORE (20 Ready Apps)${N}"
    echo -e "${W}[2] CUSTOM BUILDER (Manual)${N}"
    echo -e "${W}[3] VIEW STORAGE (.apk Files)${N}"
    echo -e "${W}[0] EXIT${N}"
    echo -en "\n${R}XXAPK >> ${N}"
    read opt

    case $opt in
        1)
            if [ -f "store.sh" ]; then
                bash store.sh
            else
                echo -e "${R}[!] store.sh not found!${N}"; sleep 2
            fi ;;
        2)
            show_logo
            echo -en "APK Name: "; read n
            echo -en "Source Folder: "; read p
            if [ -d "$p" ]; then
                zip -rj "xxapk/${n}.apk" "$p" > /dev/null 2>&1
                echo -e "${G}[SUCCESS] Saved to xxapk/${n}.apk${N}"; sleep 2
            else
                echo -e "${R}Path Error!${N}"; sleep 2
            fi ;;
        3)
            show_logo
            echo -e "${G}Size   |   File Name${N}"
            echo -e "${W}-----------------------------------${N}"
            ls -lh xxapk/ | grep ".apk" | awk '{print $5 "  |  " $9}' || echo -e "${R}Empty.${N}"
            echo -e "${W}-----------------------------------${N}"
            echo -e "\n${G}Total: $(ls xxapk/*.apk 2>/dev/null | wc -l) files.${N}"
            echo -e "Press Enter to go back..."; read ;;
        0) clear; exit ;;
    esac
done
