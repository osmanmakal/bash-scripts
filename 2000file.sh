#!/bin/bash
# Calistirildigi dizinde 2000 tane dosya yaratan basit bash
say=0
while true; do
say=$(( $say + 1 ))
echo "$say defa calisti"
touch dosya-$RANDOM.txt
if [ $say = 2000 ];then
	exit 0
fi
done
