#! /bin/bash

cd /tmp
tar xzf rt-kernel.tgz
cd /tmp/boot

sudo cp -rd * /boot/
sleep 2
cd /tmp/lib
sudo cp -dr * /lib/
sleep 2
cd /tmp/overlays
sudo cp -d * /boot/overlays
sleep 2
cd /tmp
sudo cp -d bcm* /boot/
sleep 2

#echo "kernel=kernel7_rt.img" >> /boot/config.txt
#sudo reboot
