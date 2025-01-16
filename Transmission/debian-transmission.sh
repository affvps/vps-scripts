#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

apt-get update && apt-get install -y ca-certificates wget curl

# Transmission | Debian

# VERSION CHOICE

# CONFIGURATION
username=""
read -p "Set username(transmission_username):" username
if [ "$username" = "" ]; then
	username="transmission_username"
fi

password=""
read -p "Set password(transmission_password):" password
if [ "$password" = "" ]; then
	password="transmission_password"
fi

port=""
read -p "Set port(1989):" port
if [ "$port" = "" ]; then
	port="1989"
fi

	get_char()
	{
	SAVEDSTTY=`stty -g`
	stty -echo
	stty cbreak
	dd if=/dev/tty bs=1 count=1 2> /dev/null
	stty -raw
	stty echo
	stty $SAVEDSTTY
	}
	echo ""
	echo "Press any key to start...or Press Ctrl+c to cancel"
	char=`get_char`

# START
	apt-get update
	apt-get upgrade
	apt-get full-upgrade
	apt-get dist-upgrade
	apt-get -y install transmission-daemon

# SETTINGS.JSON
/etc/init.d/transmission-daemon stop
wget https://raw.githubusercontent.com/affvps/vps-scripts/master/Transmission/settings.json
mv -f settings.json /var/lib/transmission-daemon/info/
sed -i 's/^.*rpc-username.*/"rpc-username": "'$(echo $username)'",/' /var/lib/transmission-daemon/info/settings.json
sed -i 's/^.*rpc-password.*/"rpc-password": "'$(echo $password)'",/' /var/lib/transmission-daemon/info/settings.json
sed -i 's/^.*rpc-port.*/"rpc-port": '$(echo $port)',/' /var/lib/transmission-daemon/info/settings.json
/etc/init.d/transmission-daemon start

mkdir -p /home/downloads/
mkdir -p /home/downloadsCache/
chmod -R 777 /home/downloads/
chmod -R 777 /home/downloadsCache/

# END
clear
echo "Done."
echo " "
echo "Web GUI: http://your ip:$port/"
echo "username: $username"
echo "password: $password"