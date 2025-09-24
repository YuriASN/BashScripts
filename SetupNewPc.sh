#!/bin/bash
#Install all programs I personally use and configure Ubuntu for first use
#
#Created by YuriASN, 2025

#Log into root user so sudo isn't needed
if [ $EUID != 0 ]; then
    sudo "$0" "$@"

##	Starting Installs

apt update
apt -y upgrade
#Aptitude is my preferable package program
apt -y install aptitude

#Surfshark VPN Install
aptitude -y install curl
curl -f https://downloads.surfshark.com/linux/debian-install.sh --output surfshark-install.sh
sh surfshark-install.sh

#Install snap and apps ffrom it
aptitude -y install snap
snap install slack
snap install spotify
snap install emote

#Clean installation downloads
aptitude clean


##	Starting configuration

#Add my bashrc to existing one
cat bashrc >> ~/.bashrc

#Set brightness file on it's location
chmod u=rwx brightness
cp brightness /usr/local/bin/

#Logout of root user
    exit $?
fi