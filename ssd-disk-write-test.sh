#!/bin/bash
byte="128K"
tekrar="1000000"
cpu=$(cat /proc/cpuinfo  | grep processor | wc -l)
# Yaratmak Allah'a mahsustur. 
yarat() {
	sync; dd if=/dev/zero of=tempfile_$1 bs=$byte count=$tekrar conv=fdatasync,notrunc;sync
}
for i in $(seq 1 $cpu);do
	yarat $i &
done
if [ ! -f tempfile_1 ];then
	exit 0
fi
varmi=$(ls -lat tempfile_* | grep tempfile | wc -l)
if [ $varmi = $cpu ];then
	for m in $(ls tempfile_*);do
		md5sum $m
	done
fi
