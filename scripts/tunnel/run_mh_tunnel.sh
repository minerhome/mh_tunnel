#!/bin/bash
sleep 10s
while true; do
    cd /root/mh_tunnel
    chmod +x /root/mh_tunnel/*
    ./mh_tunnel
    sleep 10s
done



