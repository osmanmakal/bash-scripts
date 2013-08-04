#!/bin/bash
if [[ -n $1 ]] && [[ -n $2 ]] && [[ -n $3 ]] && [[ -n $4 ]];then
        echo -n
else
        echo "invalid option!"
        echo "sh snmptest.sh [Community] [Hostname] [Option] [Octets]"
        echo "OPTION"
        echo "in  : Show Inbound Bandwidth Data"
        echo "out : Show Outbound Bandwidth Data"
        echo "SHOW OCTET STRING"
        echo "snmpwalk -v 2c -c Community Hostname ifDescr"
        exit 0
fi
OUT=$(snmpget -v2c -c $1 $2 ifOutOctets.$4 | awk '{print $4}')
IN=$(snmpget -v2c -c $1 $2 ifInOctets.$4 | awk '{print $4}')
TIME=5
SPEED=`snmpwalk -v 2c -c $1 $2 ifSpeed.$4 | awk '{print $4}'`
# Use the following variable for 10G ports
#SPEED=10000000000
PIPE=10000
if [ "$3" = "in" ]; then
        sleep $TIME
        IN2=$(snmpget -v2c -c $1 $2 ifInOctets.$4 | awk '{print $4}')
        DELTAIN=$(( $IN2 - $IN))
        INPUTBW=$(((($DELTAIN)/$TIME)*8/1024))
        percentage_use=$(echo "scale=9; $PIPE/$INPUTBW" | bc)
        PRCNTIN=$(echo "scale=0; 100/$percentage_use" | bc)
        PRCNTIN_IF=$(echo $PRCNTIN | tr -d ".")
        echo "Inbound: $INPUTBW kbps"
elif [ "$3" = "out" ]; then
        sleep $TIME
        OUT2=$(snmpget -v2c -c $1 $2 ifOutOctets.$4 | awk '{print $4}')
        DELTAOUT=$(( $OUT2 - $OUT))
        OUTPUTBW=$(((($DELTAOUT)/$TIME)*8/1024))
        percentage_use=$(echo "scale=9; $PIPE/$OUTPUTBW" | bc)
        PRCNTOUT=$(echo "scale=0; 100/$percentage_use" | bc)
        PRCNTOUT_IF=$(echo $PRCNTOUT | tr -d ".")
        echo "Outbound: $OUTPUTBW kbps"
else
        echo "invalid option!"
        echo "sh snmptest.sh [Community] [Hostname] [Option] [Octets]"
        echo "OPTION"
        echo "in  : Show Inbound Bandwidth Data"
        echo "out : Show Outbound Bandwidth Data"
        echo "SHOW OCTET STRING"
        echo "snmpwalk -v 2c -c Community Hostname ifDescr"
        exit 0
fi
