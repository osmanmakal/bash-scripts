#!/bin/bash
clear
options=("Birinci Secenek" "Ikinci Secenek" "Ucuncu Secenek" "Dorduncu Secenek")
menu() {
    echo "Secenek Listesi:"
    for i in ${!options[@]}; do 
        printf "%3d%s) %s\n" $((i+1)) "${secenek[i]:- }" "${options[i]}"
    done
    [[ "$msg" ]] && echo "$msg"; :
}
uzunmesaj="Secmeye devam et veya ENTER tuslayarak secimi bitir.: "
while menu && read -rp "$uzunmesaj" num && [[ "$num" ]]; do
    [[ "$num" != *[![:digit:]]* ]] && (( num > 0 && num <= ${#options[@]} )) || {
        msg="!!Menu icerisinde boyle bir secenek bulunmuyor!! $num"; continue; clear
    }
    ((num--)); msg="${options[num]} ${secenek[num]:+un} secildi."
    [[ "${secenek[num]}" ]] && secenek[num]="" || secenek[num]="+"
	clear
done
printf "Yapilan Secimler Sunlardir:"; msg=" nothing"
for i in ${!options[@]}; do 
    [[ "${secenek[i]}" ]] && { printf " %s" "${options[i]}"; msg=""; }
done
echo "$msg"
