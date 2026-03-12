#!/bin/bash

# --- XXAPK BUILDER PRO v300 ---
# DEV: MAZEN | THE ULTIMATE ENGINE

R='\033[1;31m'
W='\033[1;37m'
G='\033[1;30m'
N='\033[0m'

clear
echo -e "${R}"
echo "  ██╗  ██╗██╗  ██╗ █████╗ ██████╗ ██╗  ██╗"
echo "  ╚██╗██╔╝╚██╗██╔╝██╔══██╗██╔══██╗██║ ██╔╝"
echo "   ╚███╔╝  ╚███╔╝ ███████║██████╔╝█████╔╝ "
echo "   ██╔██╗  ██╔██╗ ██╔══██║██╔═══╝ ██╔═██╗ "
echo "  ██╔╝ ██╗██╔╝ ██╗██║  ██║██║     ██║  ██╗"
echo "  ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝"
echo -e "  [+---------------------------------------+]"
echo -e "  [  BUILDER: XXAPK PRO v3.0 | BY MAZEN    ]"
echo -e "  [+---------------------------------------+]"
echo -e "${N}"

while true; do
    echo -e "${W}[1]${N} ${R}VIEW STORAGE${N}"
    echo -e "${W}[2]${N} ${R}CREATE NEW APK${N}"
    echo -e "${W}[0]${N} ${W}EXIT SYSTEM${N}"
    echo -en "\n${R}XXAPK >> ${N}"
    read opt

    case $opt in
        1)
            echo -e "\n${W}--- STORAGE CONTENTS ---${N}"
            ls -h *.apk 2>/dev/null || echo -e "${G}Empty.${N}"
            echo -e "${W}------------------------${N}"
            read -p "Press Enter..."
            ;;
        2)
            echo -en "\n${W}[?] APK NAME: ${N}"
            read apk_name
            echo -en "${W}[?] TOTAL FILES: ${N}"
            read total
            
            for ((i=1; i<=total; i++)); do
                echo -e "\n${R}--- CONFIGURING FILE [$i/$total] ---${N}"
                echo -en "${W}FILE NAME: ${N}"
                read fname
                echo -en "${W}PASTE SOURCE CODE: ${N}"
                read fcode
                echo "$fcode" > "$fname"
                echo -e "${G}[DONE]${N}"
            done
            
            echo -en "\n${W}[?] APP ICON PATH: ${N}"
            read icon
            
            echo -e "\n${R}[*] COMPILING $apk_name...${N}"
            # Simulated Professional Build
            zip -r "${apk_name}.apk" * -x "*.sh" > /dev/null 2>&1
            find . -maxdepth 1 -type f ! -name "*.sh" ! -name "*.apk" -delete
            
            echo -e "${G}[SUCCESS] ${apk_name}.apk HAS BEEN GENERATED.${N}"
            sleep 2
            ;;
        0) 
            echo -e "${R}SYSTEM SHUTDOWN...${N}"
            exit 
            ;;
        *) 
            echo -e "${W}INVALID.${N}"
            sleep 1
            ;;
    esac
done
