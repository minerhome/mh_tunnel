#!/bin/bash




echo "1" >> /tmp/1.txt
sleep 30s


https://purge.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/server/inst_server_cdn.sh

https://purge.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/inst_tunnel_cdn.sh





wget https://purge.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/refresh_cdn.sh

wget   https://purge.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/v4.0.0/linux/config.yml
wget   https://purge.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/v4.0.0/linux/encrypt.yml
wget   https://purge.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/v4.0.0/linux/mh_tunnel
wget   https://purge.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/mh_tunnel.service
wget   https://purge.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/run_mh_tunnel.sh


wget  https://purge.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_server/v1.0.0/config.yml   
wget  https://purge.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_server/v1.0.0/encrypt.yml  
wget  https://purge.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_server/v1.0.0/proxy_pools.yml 
wget  https://purge.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_server/v1.0.0/mh_server
wget  https://purge.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/server/mh_server.service  
wget  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/server/run_mh_server.sh





# 用法

# bash <(curl -s -L https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/refresh_cdn.sh)

# bash <(curl -s -L https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/refresh_cdn.sh)

