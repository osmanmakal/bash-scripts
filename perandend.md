perandend.sh example
====================

1000 lines ip list file : osman.txt

cat osman.txt <br>
192.168.1.2 <br>
10.2.55.12 <br>
84.22.151.2 <br>
10.55.25.88 <br>
etc. etc. etc. <br>

sh perandend p osman.txt osman1.txt <br>
What is added to the text? : ip route <br>
osman1.txt File created

sh perandend b osman1.txt null-copy-pase.txt  <br>
What is added to the text? : 255.255.255.255 null0 <br> 
null-copy-pase.txt 
File created  <br>

cat null-copy-pase.txt <br>
ip route 192.168.1.2 255.255.255.255 null0 <br>
ip route 10.2.55.12 255.255.255.255 null0 <br>
ip route 84.22.151.2 255.255.255.255 null0 <br>
ip route 10.55.25.88 255.255.255.255 null0 <br>
