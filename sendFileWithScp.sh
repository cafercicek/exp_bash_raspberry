#! /bin/bash

scp -o StrictHostKeyChecking=No ./rt-kernel.tgz pi@$(sudo arp-scan -l |grep Raspberry |awk '{print $1}'):/tmp
