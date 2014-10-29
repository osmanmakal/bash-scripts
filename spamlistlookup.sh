#!/bin/bash
# IP dogrumu sorgular..
if [[ $1 =~ ^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$ ]]; then
        ip=$1
        #IP terse cevirir
        tersip=$(echo $ip|awk -F"." '{for(i=NF;i>0;i--) printf i!=1?$i".":"%s",$i}')
else
        echo "IP HATALI!"
        exit 0
fi
# Duzenlemek serbest
rbllistesi="bl.spamcop.net cbl.abuseat.org b.barracudacentral.org dnsbl.invaluement.com ddnsbl.internetdefensesystems.com dnsbl.sorbs.net http.dnsbl.sorbs.net dul.dnsbl.sorbs.net misc.dnsbl.sorbs.net smtp.dnsbl.sorbs.net socks.dnsbl.sorbs.net spam.dnsbl.sorbs.net web.dnsbl.sorbs.net zombie.dnsbl.sorbs.net dnsbl-1.uceprotect.net dnsbl-2.uceprotect.net dnsbl-3.uceprotect.net pbl.spamhaus.org sbl.spamhaus.org xbl.spamhaus.org zen.spamhaus.org bl.spamcannibal.org psbl.surriel.com ubl.unsubscore.com dnsbl.njabl.org combined.njabl.org rbl.spamlab.com dnsbl.ahbl.org ircbl.ahbl.org dyna.spamrats.com noptr.spamrats.com spam.spamrats.com cbl.anti-spam.org.cn cdl.anti-spam.org.cn dnsbl.inps.de drone.abuse.ch httpbl.abuse.ch dul.ru korea.services.net short.rbl.jp virus.rbl.jp spamrbl.imp.ch wormrbl.imp.ch virbl.bit.nl rbl.suresupport.com dsn.rfc-ignorant.org ips.backscatterer.org spamguard.leadmon.net opm.tornevall.org netblock.pedantic.org black.uribl.com grey.uribl.com multi.surbl.org ix.dnsbl.manitu.net tor.dan.me.uk rbl.efnetrbl.org relays.mail-abuse.org blackholes.mail-abuse.org rbl-plus.mail-abuse.org dnsbl.dronebl.org access.redhawk.org db.wpbl.info rbl.interserver.net query.senderbase.org bogons.cymru.com"
for rbl in $rbllistesi;do
    sonuc=$(dig +short $tersip.$rbl)
    #Sonuc zero degil ise IP listedir.
    if [ ! -z "$sonuc" ];then
        echo "$ip adresi $rbl listesinde sonuc: $sonuc"
    fi
done
