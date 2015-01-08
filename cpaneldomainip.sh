#!/bin/bash
# Script calistirildigi sunucuda master domain
# kayitlarinin gercekte sunucuya yonlu olup olmadigini
# kontrol etmenizi saglar.
if [ ! -d /var/cpanel/users/ ]; then
	echo "Script sadece cPanel sunucularda calisir."
	exit 0
fi
# DNS= master domain adini alır kullanıcı hesabi altinda
# birden fazla domain varsa bunlari almayacaktir.
# Tum domainler icin /etc/userdomain kullanılabilir.
for i in $(cat /var/cpanel/users/* | grep "DNS=" | cut -d= -f2);do
# Farklı bir dns sunucusu uzerinden sorgu icin 8.8.8.8 degistirin
IP=$(nslookup $i 8.8.8.8 | grep Address: | grep -v "#" | awk {'print $2'})
if [ -z $IP ];then
	# nslookup uzerinden IP gelmez ise bu hata cikar
	echo "$i Domain IP cozmuyor"
else
	# nslookup uzerinden IP gelirse sunucuda ekli
	# IP adresleri arasindami bunu kontrol eder
	varmi=$(cat /etc/ips | grep $IP | wc -l)
	if [ $varmi = 0 ];then
		echo "$i Bu sunucuda calismiyor ($IP)"
		# Alan adlari sunucuda ekli iplerde degil ise
		# bunlari ekrana basar digerlerini gostermez.
	fi
fi
done
