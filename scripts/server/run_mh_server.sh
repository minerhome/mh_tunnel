#!/bin/bash
sleep 10s
while true; do
    cd /root/mh_server
    chmod +x /root/mh_server/*
    ./mh_server
    sleep 10s
done

