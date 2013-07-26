#!/bin/bash
echo -n "IP Address :"
read IP
if [[ $IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
echo "$IP OK"
else
echo "$IP FAIL"
fi
