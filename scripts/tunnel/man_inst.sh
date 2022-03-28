#!/bin/bash


chmod 777 *
cp mh_server.service  /lib/systemd/system
systemctl daemon-reload
systemctl enable mh_server
systemctl restart mh_server








