#!/bin/bash
# Backup dizinindeki 1000den sonra eski dosyaları silen basit bash
backupdir="/backup/"
toplam=$(ls -lt $backupdir | awk {'print $9'} | wc -l)
zaman=$(date)
log="/var/log/silinen.log"
if [ $toplam > 1000 ];then
	sondan=$(( $toplam - 3 ))
	silinecek=$(( $toplam - 1000 ))
	goster=$(ls -lt $backupdir | awk {'print $9'} | tail -$sondan | tail -$silinecek)
	for i in $goster;do rm -rf $backupdir/$i;done
	echo "$date : $silinecek Adet Dosya Silindi." >> $log
	exit 0
else
	echo "Silinecek dosya yok"
	exit 0
fi
exit 0
