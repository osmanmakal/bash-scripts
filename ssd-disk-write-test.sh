#!/bin/bash
byte="128K"
# her bir dosya 128k boyutunda kaç defa tekrarlar? yani
# 128K * tekrar sayısı kadar.. Aman dikkat et disk dolmasin.
tekrar="1000000"
cpu=$(cat /proc/cpuinfo  | grep processor | wc -l)
# Yaratmak Allah'a mahsustur. 
yarat() {
	sync; dd if=/dev/zero of=tempfile_$1 bs=$byte count=$tekrar conv=fdatasync,notrunc;sync
}
# Gel, gel, ne olursan ol yine gel Mevlana
mevlana="gel"
if [ ! -f tempfile_1 ];then
	mevlana="gelme"
fi
varmi=$(ls -lat tempfile_* | grep tempfile | wc -l)
if [ $mevlana = "gelme" ];then
	if [ $varmi = $cpu ];then
		for m in $(ls tempfile_*);do
			md5sum $m
		done
		exit 0
	else
		echo "temp dosyalari siliniyor.."
		for r in $(ls tempfile_*);do
			rm -fv $r
		done
	fi
fi
for i in $(seq 1 $cpu);do
	yarat $i &
done
