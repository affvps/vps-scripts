#!/bin/bash

# Before
	apt-get update
	apt-get upgrade
	apt-get full-upgrade
	apt-get dist-upgrade
	apt-get install unzip
	apt-get install libcurl3

# START
wget https://raw.githubusercontent.com/lmc920/vps-scripts/master/H5ai/h5ai_dplayer.zip
unzip h5ai_dplayer.zip
mkdir /home/GoogleDrive
cp -r /root/h5ai_dplayer/. /home/GoogleDrive

# ADD SITE
lnmp vhost add 

# EDIT
nano /usr/local/nginx/conf/vhost/yourdomain.conf #修改网站参数，index行添加“/_h5ai/public/index.php”
nano /home/GoogleDrive/_h5ai/public/index.php #添加访问验证，第2行auth()的注释取消掉，第5行自己设置用户名及密码。