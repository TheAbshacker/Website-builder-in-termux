#/data/data/com.termux/usr/bin/bash
#Made by Ahmed ABS
clear


sleep 4

echo "Installing required packages, WARNING this script only works on termux"


sleep 3


apt update
apt upgrade
apt install figlet -y
apt install php -y

sleep 3

clear

figlet INSTALLATION WAS SUCCESSFUL...
