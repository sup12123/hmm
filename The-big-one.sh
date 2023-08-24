#!/bin/bash

echo "this is the big one. follow all instructions carefully"

#downloads the scripts to /Downloads

cd Downloads

wget https://raw.githubusercontent.com/sup12123/hmm/main/poop.sh
wget https://raw.githubusercontent.com/sup12123/hmm/main/CIS-benchmark-lazy-version.sh
wget https://raw.githubusercontent.com/sup12123/hmm/main/Password.sh
wget https://raw.githubusercontent.com/sup12123/hmm/main/Shikiller.sh
wget https://raw.githubusercontent.com/sup12123/hmm/main/pamconf.sh
wget https://raw.githubusercontent.com/sup12123/hmm/main/Grubsecure.sh

#makes the scripts executable 

cd Downloads

sudo chmod +x poop.sh CIS-benchmark-lazy-version.sh Password.sh Shitkiller.sh pamconf.sh

#execution time 

sudo ./Password.sh
sudo ./CIS-benchmark-lazy-version.sh
sudo ./shitkiller.sh
sudo ./pamconf.sh
sudo ./Grubsecure.sh

#running updates, upgrades ,and reboot.

sudo apt update
sudo apt upgrade
sudo apt autoremove 

sudo reboot



