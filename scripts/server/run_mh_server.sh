#!/bin/bash

sleep 5s

while true; do
    cd /root/mh_server
    chmod +x /root/mh_server/*
    ./mh_server
    sleep 5s
done

