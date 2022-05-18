
# 本地安装，一般是从u盘中安装到ubuntu中

sudo su root

# echo '1' | passwd --stdin root

echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

systemctl restart ssh
systemctl restart sshd


rm -rf /root/mh_tunnel
mkdir /root/mh_tunnel
cp  *.* /root/mh_tunnel/
cp  * /root/mh_tunnel/

cp /root/mh_tunnel/mh_tunnel.service   /lib/systemd/system/

systemctl daemon-reload
systemctl  enable  mh_tunnel
systemctl restart mh_tunnel

