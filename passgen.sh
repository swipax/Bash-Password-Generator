#!/bin/bash

black="\033[1;30m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
blue="\033[1;34m"
purple="\033[1;35m"
cyan="\033[1;36m"
violate="\033[1;37m"
white="\033[0;37m"
nc="\033[00m"

logo="
${green}  ________  _  _|__|__________  ___  ___ 
${red} /  ___/\ \/ \/ /  \____ \__  \ \  \/  / 
${cyan} \___ \  \     /|  |  |_> > __ \_>    <  
${purple}/____  >  \/\_/ |__|   __(____  /__/\_ \ 
${yellow}     \/            |__|       \/      \/ 
${blue}                                  By swipax
"


charset=("A" "S" "D" "F" "G" "H" "J" "K" "L" "M" "N" "B" "X" "V" "Z" "O" "P" "U" "P" "Q" "W" "E" "T" "Y" "C" "a" "c" "t" "y" "s" "d" "f" "g" "z" "o" "u" "h" "j" "k" "l" "m" "n" "b" "v" "c" "x" "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "!" "@" "#" "$"  "_" "+"  ":"  )

echo -e "$logo"


printf "${yellow}Platform:${yellow} "
read -r platform

printf "${purple}Şifre uzunluğu:${purple} "
read -r uzunluk

randpass=""
prevchar=""
for (( i=0; i<$uzunluk; i++ )); do
  while true; do
    char=${charset[$RANDOM % ${#charset[@]}]}
    if [[ "$char" != "$prevchar" ]]; then
      randpass+="$char"
      prevchar="$char"
      break
    fi
  done
done


echo -e "${black}Oluşturulan şifre: $randpass"
echo "Platform:$platform" >> pass.txt
echo "password:$randpass" >> pass.txt
echo "----------------------" >> pass.txt
echo -e "${blue}Şifre pass.txt dosyasına kaydedildi."
