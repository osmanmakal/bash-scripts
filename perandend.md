perandend.sh example
====================

1000 lines ip list file : osman.txt

cat osman.txt
192.168.1.2
10.2.55.12
84.22.151.2
10.55.25.88
etc. etc. etc.

sh perandend p osman.txt osman1.txt
What is added to the text? : ip route
osman1.txt File created

sh perandend b osman1.txt null-copy-pase.txt 
What is added to the text? : 255.255.255.255 null0
null-copy-pase.txt
File created

cat null-copy-pase.txt
ip route 192.168.1.2 255.255.255.255 null0
ip route 10.2.55.12 255.255.255.255 null0
ip route 84.22.151.2 255.255.255.255 null0
ip route 10.55.25.88 255.255.255.255 null0
