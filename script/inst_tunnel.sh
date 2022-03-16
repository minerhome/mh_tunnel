#!/bin/bash

rm -rf /root/mh_tunnel
mkdir /root/mh_tunnel

cd /root/mh_tunnel



wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/v4.0.0/linux/config.yml   
wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/v4.0.0/linux/encrypt.yml  
wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/v4.0.0/linux/mh_tunnel  
wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/v4.0.0/linux/tunnel  
wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/v4.0.0/linux/mh_tunnel.service   





chmod +x /root/mh_tunnel/*
mv /root/mh_tunnel/mh_tunnel.service  /lib/systemd/system/

systemctl restart mh_tunnel



