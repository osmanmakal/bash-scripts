#!/bin/bash
# Uzak sunucudaki backupları calistirilan yere ceken basit cronluk bash
ip="192.168.10.12"
password"rootpassword"
/usr/bin/expect - << EOF
set timeout  -1
spawn rsync -avz -l -p -t root@$ip:/backup/cpbackup/ /backup/cpanelbackup
expect  "password:" { send "$password\n"}
EOF
