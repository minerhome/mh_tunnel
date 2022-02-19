#!/bin/bash
pid=`ps -ef | grep "mh_tunnel" | grep -v "grep" | grep -v "mh_tunnel.sh"  | awk '{print $2}'`
if [ -n "$pid" ]
then
	echo "kill running mh_tunnel $pid"
	kill -9 $pid
fi
args=$*
rm -rf /mh_tunnel/mh_tunnel
mkdir /mh_tunnel
cd /mh_tunnel


# wget --no-check-certificate wget https://github.com/minerhome/mh_tunnel/raw/main/release/v2.2/mh_tunnel  
# wget --no-check-certificate wget https://github.com/minerhome/mh_tunnel/raw/main/release/v2.2/config.yml
# wget --no-check-certificate wget https://github.com/minerhome/mh_tunnel/raw/main/release/v2.2/encrypt.yml

wget --no-check-certificate  https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@main/release/v2.2/mh_tunnel  -O /mh_tunnel/mh_tunnel
wget --no-check-certificate  https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@main/release/v2.2/config.yml  -O /mh_tunnel/config.yml
wget --no-check-certificate  https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@main/release/v2.2/encrypt.yml  -O /mh_tunnel/encrypt.yml


chmod +x mh_tunnel
nohup /mh_tunnel/mh_tunnel $args 2>&1 > /mh_tunnel/mh_tunnel.log &
rm -rf /etc/rc.local
cat >> /etc/rc.local << EOF
#!/bin/bash
##!/bin/sh -e
nohup /mh_tunnel/mh_tunnel $args 2>&1 > /mh_tunnel/mh_tunnel.log &
exit 0
EOF
chmod +x /etc/rc.local
cat /mh_tunnel/mh_tunnel.log
exit 0
