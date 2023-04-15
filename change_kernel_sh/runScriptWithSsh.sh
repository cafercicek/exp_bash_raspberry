#! /bin/bash

#ssh -o StrictHostKeyChecking=No pi@$(sudo arp-scan -l |grep Raspberry |awk '{print $1}') <otam.sh
ssh -o StrictHostKeyChecking=No pi@192.168.0.24 < otam.sh

