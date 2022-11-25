#! /bin/bash

#ssh -o StrictHostKeyChecking=No pi@$(sudo arp-scan -l |grep Raspberry |awk '{print $1}') <otam.sh
ssh -o StrictHostKeyChecking=No pi@$(sudo arp-scan -l |grep Raspberry |awk '{print $1}') <ChangeBootKernel.sh
#ssh -o StrictHostKeyChecking=No pi@$(sudo arp-scan -l |grep Raspberry |awk '{print $1}') <deneme.sh
#ssh -o StrictHostKeyChecking=No pi@$(sudo arp-scan -l |grep Raspberry |awk '{print $1}') <iwasthere.sh

