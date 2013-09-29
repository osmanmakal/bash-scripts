#!/bin/bash
while true; do
    read -p "Sozlesmeyi kabul ediliyormusun? [E/H]: " cevap
    case $cevap in
        [Ee]* ) echo  Sozlesme Kabul Edildi ; break;;
        [Hh]* ) exit 0;;
        * ) echo "Evet için E, Hayir icin H kullaniniz.";;
    esac
done
