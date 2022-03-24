#!/bin/bash
 
cd /root/mh_tunnel
chmod +x /root/mh_tunnel/*
while true; do
    ./mh_tunnel &
    sleep 5s
done
exit 0





