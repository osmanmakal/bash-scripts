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
w=`echo $ip | sed -e 's/\/$sub/ $w8/g'`
echo $ip $w
elif [ "$sub" = "9" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w9/g'`
echo $ip $w
elif [ "$sub" = "10" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w10/g'`
echo $ip $w
elif [ "$sub" = "11" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w11/g'`
echo $ip $w
elif [ "$sub" = "12" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w12/g'`
echo $ip $w
elif [ "$sub" = "13" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w13/g'`
echo $ip $w
elif [ "$sub" = "14" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w14/g'`
echo $ip $w
elif [ "$sub" = "15" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w15/g'`
echo $ip $w
elif [ "$sub" = "16" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w16/g'`
echo $ip $w
elif [ "$sub" = "17" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w17/g'`
echo $ip $w
elif [ "$sub" = "18" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w18/g'`
echo $ip $w
elif [ "$sub" = "19" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w19/g'`
echo $ip $w
elif [ "$sub" = "20" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w20/g'`
echo $ip $w
elif [ "$sub" = "21" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w21/g'`
echo $ip $w
elif [ "$sub" = "22" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w22/g'`
echo $ip $w
elif [ "$sub" = "23" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w23/g'`
echo $ip $w
elif [ "$sub" = "24" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w24/g'`
echo $ip $w
elif [ "$sub" = "25" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w25/g'`
echo $ip $w
elif [ "$sub" = "26" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w26/g'`
echo $ip $w
elif [ "$sub" = "27" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w27/g'`
echo $ip $w
elif [ "$sub" = "28" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w28/g'`
echo $ip $w
elif [ "$sub" = "29" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w29/g'`
echo $ip $w
elif [ "$sub" = "30" ]; then
w=`echo $ip | sed -e 's/\/$sub/ $w30/g'`
echo $ip $w
else
echo "$1 is not supported or incorrect subnet."
fi

