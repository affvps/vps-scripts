#!/bin/bash

# Before
	apt-get update
	apt-get upgrade
	apt-get full-upgrade
	apt-get dist-upgrade
	apt-get install unzip

# START
wget https://raw.githubusercontent.com/lmc920/vps-scripts/master/Speedtest4HTML5/Speedtest4HTML5.zip
unzip Speedtest4HTML5.zip
mkdir /home/wwwroot/yoursitedirectory
cp -r /root/Speedtest4HTML5/. /home/wwwroot/yoursitedirectory

# ADD SITE
lnmp vhost add 
