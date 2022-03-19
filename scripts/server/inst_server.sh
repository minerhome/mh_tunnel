#!/bin/bash

[[ $(id -u) != 0 ]] && echo -e "请使用root权限运行安装脚本， 通过sudo su root切换再来运行" && exit 1

name = "端对端加密隧道解密端（服务端）"

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
        echo -e "安装成功，$name 已经在运行......" 
        echo -e "详细用法请上网站查阅 https://minerhome.org \n" 
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


change_limit(){
    num="n"
    if [ $(grep -c "root soft nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root soft nofile 102400" >>/etc/security/limits.conf
        num="y"
    fi

    if [[ "$num" = "y" ]]; then
        echo "连接数限制已修改为102400,重启服务器后生效"
    else
        echo -n "当前连接数限制："
        ulimit -n
    fi
}


install() {

    ufw disable
    $cmd update -y
    $cmd install wget -y
    $cmd install net-tools -y

    rm -rf /root/mh_server
    mkdir /root/mh_server
    cd /root/mh_server

    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/mh_server/v1.0.0/config.yml   
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/mh_server/v1.0.0/encrypt.yml  
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/mh_server/v1.0.0/proxy_pools.yml  
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/mh_server/v1.0.0/mh_server
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/server/mh_server.service
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/server/run_mh_server.sh

    chmod +x /root/mh_server/*
    mv /root/mh_server/mh_server.service  /lib/systemd/system/

    systemctl enable mh_server
    systemctl restart mh_server
  

}






echo "======================================================="
echo "$name 一键安装工具 - 矿工之家 - minerhome.org"
echo "默认安装到/root/mh_server"
echo "如果安装不成功，则重启服务器后重新安装"
echo "出现各种选择，请按 确认/OK"
echo "======================================================="

change_limit
install
echo "检查是否安装成功，稍等"
sleep 20s
check_done

 
 


