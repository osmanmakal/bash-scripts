subnettowildcard.sh examples
============================

1000 line bit maks file : osman.txt

cat osman.txt
89.207.224.0/21
108.59.80.0/20
108.170.192.0/18
108.177.0.0/17
142.250.0.0/15
Etc. Etc. Etc.


for i in $(cat osman.txt); do sh subnettowildcard.sh  $i;done >> osman-wildcard.txt

cat osman-wildcard.txt
89.207.224.0 0.0.7.255
108.59.80.0 0.0.15.255
108.170.192.0 0.0.63.255
108.177.0.0 0.0.127.255
142.250.0.0 0.1.255.255


