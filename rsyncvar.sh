#!/bin/bash
tarih=$(date +%d/%m/%Y)
saat=$(date +%H:%M:%S)
zaman="$tarih $saat"
logdir="/var/log/rsynccore.log"
email="eposta@example.com"
if [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
echo -n
else
echo "IP yanlis yazdin."
exit 0
fi
ping -c 1 $1 > /dev/null
if  [ $? -eq 0 ];then
        echo "$zaman : Calisti" >> $logdir

else
        echo "$zaman : $1 Kapali.." >> $logdir
        mail -s "RSYNC Yapilamadi!" $email <<< "$1 IP adresi calismiyor RSYNC yapilamadi"
        exit 0
fi
dir1="dir1"
dir2="dir2"
password="$2"
/usr/bin/expect - << EOF
set timeout  -1
spawn rsync -avz -l -p -t root@$1:$dir1 $dir2
expect  "password:" { send "$password\n"}
expect "#"
spawn date
expect "#"
EOF

# Amale log rotate :)
logsay=$(cat $logdir | wc -l)
if [ $logsay -gt 1000 ];then
        cat $logdir | tail -1000 > /tmp/rotate.log
        cat /tmp/rotate.log > $logdir
        rm -rf /tmp/rotate.log
fi
