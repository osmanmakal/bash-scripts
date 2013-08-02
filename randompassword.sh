#!/bin/bash
karma=`date +%s | md5sum  | awk '{print $1}' | cut -c 1,2,3,4,5,6,7,8`
echo -n "Karmasik Kodunuz       : "
echo -n "$karma"
echo
