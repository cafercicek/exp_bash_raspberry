#! /bin/bash

cd /tmp
tar xzf rt-kernel.tgz
cd /tmp/boot

sudo cp -rd * /boot/
cd /tmp/lib
sudo cp -rd * /lib/
cd /tmp/overlays
sudo cp -d * /boot/overlays
cd /tmp
sudo cp -d bcm* /boot/


sudo cp -d /tmp/config.txt /boot/

sudo reboot
