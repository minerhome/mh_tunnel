#!/bin/bash

rm -rf /root/mh_tunnel
mkdir /root/mh_tunnel

cd /root/mh_tunnel






wget https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/v4.0.0/linux/config.yml   -O /root/mh_tunnel
wget https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/v4.0.0/linux/encrypt.yml   -O /root/mh_tunnel
wget https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/v4.0.0/linux/mh_tunnel   -O /root/mh_tunnel
wget https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/v4.0.0/linux/tunnel   -O /root/mh_tunnel
wget https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/v4.0.0/linux/mh_tunnel.service   -O /root/mh_tunnel





chmod +x /root/mh_tunnel/*
mv /root/mh_tunnel/mh_tunnel.service  /lib/systemd/system/mh_tunnel.service

systemctl restart mh_tunnel



