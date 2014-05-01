
#!/bin/bash
tarih=$(date +%Y-%m-%d)
saat=$(date +"%H")

cat /var/log/exim_mainlog | grep $tarih > /tmp/eximcheck.log
#yirmidort=$(cat /tmp/eximcheck.log | awk {'print $3'} | grep "-" | grep -v "H=" | wc -l)

toplam="0"
for i in 0 1 2;do
        say=$(( $saat - $i ))
        satir=$(cat /tmp/eximcheck.log | grep "$tarih $say:" |awk {'print $3'} | grep "-" | grep -v "H=" | wc -l)
        toplam=$(( $toplam + $satir ))
done
echo $toplam
