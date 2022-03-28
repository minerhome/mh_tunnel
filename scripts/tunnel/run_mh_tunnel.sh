#!/bin/bash
sleep 10s
cd /root/mh_tunnel
chmod +x /root/mh_tunnel/*
while true; do
    ./mh_tunnel
    sleep 10s
done

