#!/bin/bash

sleep 10s
cd /root/mh_server
chmod +x /root/mh_server/*
while true; do
    ./mh_server
    sleep 10s
done

