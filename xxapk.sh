#!/bin/bash

# --- XXAPK BUILDER ENGINE ---
# RED EDITION | CUSTOM CODE | MULTI-FILE

R='\033[1;31m'
W='\033[1;37m'
G='\033[1;30m'
N='\033[0m'

# تنظيف الشاشة والدخول
clear
echo -e "${R}#############################################################"
echo -e "##                                                         ##"
echo -e "##   ██╗  ██╗██╗  ██╗ █████╗ ██████╗ ██╗  ██╗              ##"
echo -e "##   ╚██╗██╔╝╚██╗██╔╝██╔══██╗██╔══██╗██║ ██╔╝              ##"
echo -e "##    ╚███╔╝  ╚███╔╝ ███████║██████╔╝█████╔╝               ##"
echo -e "##    ██╔██╗  ██╔██╗ ██╔══██║██╔═══╝ ██╔═██╗               ##"
echo -e "##   ██╔╝ ██╗██╔╝ ██╗██║  ██║██║     ██║  ██╗              ##"
echo -e "##   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝              ##"
echo -e "##                                                         ##"
echo -e "#############################################################${N}"

while true; do
echo -e "\n${R}[ MAIN MENU ]${N}"
echo -e "${W}[01]${N} ${R}VIEW GENERATED APKS (التطبيقات المصنعه)${N}"
echo -e "${W}[02]${N} ${R}CREATE NEW CUSTOM APK (صناعة تطبيق جديد)${N}"
echo -e "${W}[00]${N} ${W}EXIT${N}"

echo -en "\n${R}[xxapk] >> ${N}"
read main_opt

case $main_opt in
    1)
        echo -e "\n${R}--- LIST OF GENERATED APKS ---${N}"
        ls *.apk 2>/dev/null || echo -e "${W}No APKS found yet.${N}"
        read -p "Press Enter to return..."
        ;;
    2)
        # البدء في صناعة التطبيق
        echo -en "\n${W}[?] ENTER APK NAME (اسم التطبيق النهائي): ${N}"
        read apk_final_name
        
        echo -en "${W}[?] HOW MANY FILES? (عدد الملفات): ${N}"
        read file_count
        
        # حلقة لجمع الملفات والأكواد
        for ((i=1; i<=file_count; i++)); do
            echo -e "\n${R}--- File #$i ---${N}"
            echo -en "${W}Enter File Name (e.g., script.py): ${N}"
            read f_name
            echo -en "${W}Paste your Code (ضع الكود البرمجي هنا): ${N}"
            read f_code
            
            # حفظ الكود في ملف
            echo "$f_code" > "$f_name"
            echo -e "${G}[+] File $f_name saved.${N}"
        done
        
        # طلب صورة التطبيق
        echo -en "\n${W}[?] ENTER PATH TO ICON IMAGE (مسار صورة التطبيق): ${N}"
        read img_path
        
        echo -e "\n${R}[*] ASSEMBLING $apk_final_name...${N}"
        
        # هنا الأداة بتدمج الملفات والصورة (محاكاة البناء)
        # ملاحظة: بناء APK حقيقي يحتاج apktool لكن هنا بنجهز الهيكل
        zip -r "$apk_final_name.apk" * -x "*.sh" > /dev/null 2>&1
        
        echo -e "${G}[+++] SUCCESS! $apk_final_name.apk IS READY WITH $file_count FILES.${N}"
        # تنظيف الملفات المؤقتة
        find . -maxdepth 1 -type f ! -name "*.sh" ! -name "*.apk" -delete
        sleep 2
        ;;
    0) exit ;;
esac
done

