#!/bin/bash
# cPanel Include Global Conf : /usr/local/apache/conf/includes/pre_main_global.conf
# dirconf degiskenine yazmayi unutmayin veya baska dosya yazacaksaniz dizin belirtin
dirconf="/usr/local/apache/conf/includes/defaultpage/"
hostname=$(hostname)

if [ -d /usr/local/apache/conf/includes/ ];then
	if [ -d /usr/local/apache/conf/includes/defaultpage ];then
		echo -n
	else
		mkdir /usr/local/apache/conf/includes/defaultpage
	fi
else
	echo "Hata olustu!"
	exit 0
fi


for i in $( cat /etc/ips | cut -d: -f1 );do
     ozelmi=$(cat /etc/domainips | grep $i | wc -l)
     varmi=$(ls $dirconf | grep $i | wc -l)
        if [ $varmi = 0 ];then
	        if [ $ozelmi = 0 ];then
	                echo "$i Paylasimli IP" >> /tmp/islemyapilan.txt
	                echo "<VirtualHost $i:80>" >> $dirconf$i.conf
	                echo "	ServerName $hostname" >> $dirconf$i.conf
	                echo "	DocumentRoot /usr/local/apache/htdocs" >> $dirconf$i.conf
	                echo "	ServerAdmin root@$hostname" >> $dirconf$i.conf
	                echo "	<IfModule mod_suphp.c>" >> $dirconf$i.conf
	                echo "		suPHP_UserGroup nobody nobody" >> $dirconf$i.conf
	                echo "	</IfModule>" >> $dirconf$i.conf
	                echo "</VirtualHost>" >> $dirconf$i.conf
	        else
	                echo "$i Ozel IP" >> /tmp/islemyapilmayan.txt
	        fi
	    else
	    	echo "$i Conf Dosyasinda Var " >> /tmp/islemyapilmayan.txt
	    fi
done

for d in $( cat /etc/domainips | grep : | cut -d: -f1 );do
	degisen=$(ls $dirconf | grep $b | wc -l)
	if [ $degisen = 1 ];then
		echo "rm -rf $dirconf$i.conf"
	fi
done

echo "[ Islem Yapilan IP Adresleri ]"
echo
cat /tmp/islemyapilan.txt
echo
echo "[ Islem YAPILMAYAN IP Adresleri ]"
echo
cat /tmp/islemyapilmayan.txt
echo
# Temizle
rm -rf /tmp/islemyapilan.txt
rm -rf /tmp/islemyapilmayan.txt