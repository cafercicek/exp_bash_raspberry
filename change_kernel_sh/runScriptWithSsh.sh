#! /bin/bash

#ssh -o StrictHostKeyChecking=No pi@$(sudo arp-scan -l |grep Raspberry |awk '{print $1}') <otam.sh
ssh -o StrictHostKeyChecking=No pi@${RASPBERRY_IP_ADD} < otam.sh

