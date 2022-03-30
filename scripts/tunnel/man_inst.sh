#!/bin/bash



apt install supervisor

rm /etc/supervisor/conf.d/mh_tunnel.conf -f

echo "[program:mh_tunnel]" >>/etc/supervisor/conf.d/mh_tunnel.conf
echo "command=/root/mh_tunnel/mh_tunnel" >>/etc/supervisor/conf.d/mh_tunnel.conf
echo "directory=/root/mh_tunnel/" >>/etc/supervisor/conf.d/mh_tunnel.conf
echo "autostart=true" >>/etc/supervisor/conf.d/mh_tunnel.conf
echo "autorestart=true" >>/etc/supervisor/conf.d/mh_tunnel.conf
echo "stdout_logfile=NONE" >>/etc/supervisor/conf.d/mh_tunnel.conf
echo "stderr_logfile=NONE" >>/etc/supervisor/conf.d/mh_tunnel.conf


systemctl restart supervisor


# chmod 777 *
# # cp mh_tunnel.service  /lib/systemd/system
# systemctl daemon-reload
# systemctl enable mh_server
# systemctl restart mh_server








