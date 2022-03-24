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
        echo -e "-----------------------------------"
        echo -e "\n" 
        echo -e "安装成功，端对端加密隧道 - 加密端（本地端）- 已经在运行......" 
        echo -e "详细用法请上 https://minerhome.org 网站查阅\n" 
        echo -e "\n" 
        echo -e "-----------------------------------"
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
    wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/mh_setup  -O /root/mh_tunnel/mh_setup
    chmod +x /root/mh_tunnel/*
    ./mh_setup
}




clear
echo "======================================================="
echo "设置 - 端对端加密隧道 - 加密端（本地端）- 矿工之家 - minerhome.org"
echo "======================================================="
sleep 5s
setup


 
 








