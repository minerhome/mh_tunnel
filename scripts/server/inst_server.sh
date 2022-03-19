#!/bin/bash


rm -rf /root/mh_server
mkdir /root/mh_server

cd /root/mh_server



wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/mh_server/v1.0.0/config.yml   
wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/mh_server/v1.0.0/encrypt.yml  
wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/mh_server/v1.0.0/conmh_server


wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/server/mh_server.service
wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/server/run_mh_server.sh


chmod +x /root/mh_server/*
mv /root/mh_server/mh_server.service  /lib/systemd/system/

systemctl enable mh_server
systemctl restart mh_server



