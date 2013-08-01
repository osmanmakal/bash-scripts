#!/bin/bash
#Subnet address validation
if [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\/[0-9]{1,2}$ ]]; then
  echo -n
else
  echo "$1 Wrong ip subnet address."
  exit 0
fi


#Wildcard Mask List
w8="0.255.255.255"
w9="0.127.255.255"
w10="0.63.255.255"
w11="0.31.255.255"
w12="0.15.255.255"
w13="0.7.255.255"
w14="0.3.255.255"
w15="0.1.255.255"
w16="0.0.255.255"
w17="0.0.127.255"
w18="0.0.63.255"
w19="0.0.31.255"
w20="0.0.15.255"
w21="0.0.7.255"
w22="0.0.3.255"
w23="0.0.1.255"
w24="0.0.0.255"
w25="0.0.0.127"
w26="0.0.0.63"
w27="0.0.0.31"
w28="0.0.0.15"
w29="0.0.0.7"
w30="0.0.0.3"

#Variable Bits in Mask
sub=`echo $1 | cut -d/ -f2`

#IP Address
ip=`echo $1 | cut -d/ -f1`

#Bits in Mask to Wildcard Mask
if [ "$sub" = "8" ]; then
echo "$ip $w8"
elif [ "$sub" = "9" ]; then
echo "$ip $w9"
elif [ "$sub" = "10" ]; then
echo "$ip $w10"
elif [ "$sub" = "11" ]; then
echo "$ip $w11"
elif [ "$sub" = "12" ]; then
echo "$ip $w12"
elif [ "$sub" = "13" ]; then
echo "$ip $w13"
elif [ "$sub" = "14" ]; then
echo "$ip $w14"
elif [ "$sub" = "15" ]; then
echo "$ip $w15"
elif [ "$sub" = "16" ]; then
echo "$ip $w16"
elif [ "$sub" = "17" ]; then
echo "$ip $w17"
elif [ "$sub" = "18" ]; then
echo "$ip $w18"
elif [ "$sub" = "19" ]; then
echo "$ip $w19"
elif [ "$sub" = "20" ]; then
echo "$ip $w20"
elif [ "$sub" = "21" ]; then
echo "$ip $w21"
elif [ "$sub" = "22" ]; then
echo "$ip $w22"
elif [ "$sub" = "23" ]; then
echo "$ip $w23"
elif [ "$sub" = "24" ]; then
echo "$ip $w24"
elif [ "$sub" = "25" ]; then
echo "$ip $w25"
elif [ "$sub" = "26" ]; then
echo "$ip $w26"
elif [ "$sub" = "27" ]; then
echo "$ip $w27"
elif [ "$sub" = "28" ]; then
echo "$ip $w28"
elif [ "$sub" = "29" ]; then
echo "$ip $w29"
elif [ "$sub" = "30" ]; then
echo "$ip $w30"
else
echo "$1 is not supported or incorrect subnet."
fi
