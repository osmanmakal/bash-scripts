#!/bin/bash
# Uygulamanın calismasi icin netcat yani nc komutu aktif olmalidir.
# Portları aralarında bir bosluk olacak sekilde yazin.
port_range="135 139 445"

which nc > /dev/null
if (( ! $? == 0 ));then
  echo "nc komutu yok. Netcat yukleyip tekrar deneyiniz."
  exit 1
else
  system=$(which timeout > /dev/null;echo $?)
fi

bilgi() {
  echo "Komut icin birincil parametre subnet adresi olabilir. ORNEK: 192.168.0.0/24"
}

ipdogrula() {
  if [[ ! $1 =~ ^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([0-9]|[1-2][0-9]|3[0-2]))$ ]]
  then
    bilgi
    exit 1
  else
    ip=$(echo "$1" | cut -d\/ -f1)
    mask=$(echo "$1" | cut -d\/ -f2)
  fi
}

ip2dec () {
    local a b c d ip=$@
    IFS=. read -r a b c d <<< "$ip"
    printf '%d\n' "$((a * 256 ** 3 + b * 256 ** 2 + c * 256 + d))"
}

dec2ip () {
    local ip dec=$@
    for e in {3..0}
    do
        ((octet = dec / (256 ** e) ))
        ((dec -= octet * 256 ** e))
        ip+=$delim$octet
        delim=.
    done
    printf '%s\n' "$ip"
}

range() {
  ipdogrula $1
  s=$(( 32 - $mask))
  r=$(( 2 ** $s))
  start=$(ip2dec $ip)
  end=$(($start+$r))
  c=$start
  while true;do
    if (( $c == $end ));then
      break
    fi
    realip=$(dec2ip "$c")
    echo $realip
    c=$(($c+1))
  done
}

ports() {
  for i in $ips;do
    for p in $port_range;do
      if (( $system == 0 ));then
        timeout 1 nc -zd $i $p > /dev/null
      else
        nc -zd -G1 $i $p > /dev/null
      fi
      if (( $? == 0 ));then
        echo "$i port $p open"
      fi
    done
  done
}

if [ -z $1 ];then
  bilgi
  exit 1
else
  ips=$(range $1)
  ports
fi
