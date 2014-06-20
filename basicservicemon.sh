#!/bin/bash
service=$(ps aux | grep named | grep -v grep | wc -l)
tarih=$(date +%d/%m/%Y)
saat=$(date +%H:%M:%S)
zaman="$tarih $saat"
logdir="/var/log/servis.log"
email="email@adresi.com"
hostname=$(hostname)
if [ $service = 0 ];then
    /sbin/service named restart
    echo "$zaman : DNS Servisi kapali. Restart edildi! $hostname" >> $logdir
    mail -s "DNS Servisi Calismiyor. Restart Edildi" $email <<< "$hostname DNS Servisi Calismiyor. Restart Edildi"
    exit 0
fi