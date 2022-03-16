#!/bin/bash

rm -rf /mh_tunnel/mh_tunnel
mkdir /mh_tunnel

cd /mh_tunnel

wget --no-check-certificate  https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@main/release/v4.0.0/mh_tunnel  -O /mh_tunnel/mh_tunnel
wget --no-check-certificate  https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@main/release/v4.0.0/tunnel  -O /mh_tunnel/tunnel
wget --no-check-certificate  https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@main/release/v4.0.0/config.yml  -O /mh_tunnel/config.yml
wget --no-check-certificate  https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@main/release/v4.0.0/encrypt.yml  -O /mh_tunnel/encrypt.yml
wget --no-check-certificate  https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@main/release/v4.0.0/run_tunnel.sh  -O /mh_tunnel/run_tunnel.sh
wget --no-check-certificate  https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@main/release/v4.0.0/mh_tunnel.service  -O /mh_tunnel/mh_tunnel.service

chmod +x /mh_tunnel/*
mv /mh_tunnel/mh_tunnel.service  /lib/systemd/system/mh_tunnel.service

systemctl restart mh_tunnel



