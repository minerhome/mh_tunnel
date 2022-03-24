#!/bin/bash

[[ $(id -u) != 0 ]] && echo -e "请使用root权限运行安装脚本， 通过sudo su root切换再来运行" && exit 1

name = "端对端加密隧道 - 加密端（本地端）"
cmd="apt-get"

if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
    if [[ $(command -v yum) ]]; then
        cmd="yum"
    fi
else
    echo "此脚本不支持该系统" && exit 1
fi


check_done() {
    if netstat -antpl | grep -q "12510"; then
        echo -e "\n\n" 
        echo -e "--------------------------------------------------------"
        echo -e "\n" 
        echo -e "安装成功，端对端加密隧道 - 加密端（本地端）- 已经在运行......" 
        echo -e "详细用法请上 https://minerhome.org 网站查阅\n" 
        echo -e "\n" 
        echo -e "---------------------------------------------------------"
        echo -e "\n" 
    else        
        echo -e "\n\n" 
        echo "安装不成功，请重启后重新安装"   
        echo "出现各种选择，请按 确认/OK"
        echo -e "\n\n" 
    fi      
}


setup() {

    cd /root/mh_tunnel
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/tunnel/mh_setup   -O /root/mh_tunnel/mh_setup
    chmod +x /root/mh_tunnel/*
    ./mh_setup
}

install() {

    # ufw disable
    $cmd update -y
    $cmd install wget -y
    $cmd install net-tools -y
        
    rm -rf /root/mh_tunnel
    mkdir /root/mh_tunnel
    cd /root/mh_tunnel

    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/v4.0.0/linux/config.yml    -O /root/mh_tunnel/config.yml
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/v4.0.0/linux/encrypt.yml    -O /root/mh_tunnel/encrypt.yml
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/v4.0.0/linux/mh_tunnel     -O /root/mh_tunnel/mh_tunnel
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/tunnel/mh_tunnel.service      -O /root/mh_tunnel/mh_tunnel.service 
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/tunnel/run_mh_tunnel.sh     -O /root/mh_tunnel/run_mh_tunnel.sh

    chmod +x /root/mh_tunnel/*
    mv /root/mh_tunnel/mh_tunnel.service  /lib/systemd/system/

    systemctl enable mh_tunnel
    systemctl restart mh_tunnel
  

}



clear
echo "================================================================="
echo "设置 - 端对端加密隧道 - 加密端（本地端）- 矿工之家 - minerhome.org"
echo "================================================================="
sleep 5s
# install
setup
# clear
# echo "正在检查是否安装成功，请稍等......"
# sleep 20s
# check_done

 
 








