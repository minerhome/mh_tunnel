#!/bin/bash

[[ $(id -u) != 0 ]] && echo -e "请使用root权限运行安装脚本， 通过sudo su root切换再来运行" && exit 1

# name = "端对端加密隧道 - 解密端（服务端）"

cmd="apt-get"
if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
    if [[ $(command -v yum) ]]; then
        cmd="yum"
    fi
else
    echo "此脚本不支持该系统" && exit 1
fi


start() {
    if netstat -anptl | grep -q "mh_server"; then
        echo -e "mh_server 已启动,请勿重复启动" && exit 1
    fi
    systemctl start mh_server 
    echo "mh_server 已启动"
}

restart() {
    systemctl restart mh_server 
    echo "mh_server 重新启动成功" 
}

stop() {
    systemctl stop mh_server 
    echo "mh_server 停止成功" 
}


check_done() {
    if netstat -antpl | grep -q "12510"; then
        echo -e "\n\n" 
        echo -e "-----------------------------------"
        echo -e "\n" 
        echo -e "安装成功，端对端加密隧道 - 解密端（服务端）- 已经在运行......" 
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
        echo "root soft nofile 65535" >>/etc/security/limits.conf
        num="y"
    fi

    if [[ "$num" = "y" ]]; then
        echo "连接数限制已修改为 65535, 重启服务器后生效"
    else
        echo -n "当前连接数限制："
        ulimit -n
    fi
}

check_limit(){
    echo -n "当前连接数限制："
    ulimit -n
}

uninstall() {
        systemctl stop mh_server
        systemctl disable mh_server
        rm -rf /root/mh_server
}



install() {

    ufw disable
    $cmd update -y
    $cmd install wget -y
    $cmd install net-tools -y

    rm -rf /root/mh_server
    mkdir /root/mh_server
    cd /root/mh_server

    echo "请选择安装的版本"
    echo "  1、v1.0.0"
    echo "  2、v4.1.0"
    echo "  3、v4.2.0"
    read -p "$(echo -e "请输入[1-3]：")" choose
    case $choose in
    1)
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v1.0.0/config.yml  -O  /root/mh_server/config.yml
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v1.0.0/encrypt.yml  -O  /root/mh_server/encrypt.yml
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v1.0.0/proxy_pools.yml  -O  /root/mh_server/proxy_pools.yml
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v1.0.0/mh_server  -O  /root/mh_server/mh_server
        ;;
    2)
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v4.1.0/config.yml  -O  /root/mh_server/config.yml
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v4.1.0/encrypt.yml  -O  /root/mh_server/encrypt.yml
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v4.1.0/proxy_pools.yml  -O  /root/mh_server/proxy_pools.yml
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v4.1.0/mh_server  -O  /root/mh_server/mh_server
        ;;
    3)
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v4.2.0/config.yml  -O  /root/mh_server/config.yml
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v4.2.0/encrypt.yml  -O  /root/mh_server/encrypt.yml
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v4.2.0/proxy_pools.yml  -O  /root/mh_server/proxy_pools.yml
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v4.2.0/mh_server  -O  /root/mh_server/mh_server
        ;;
    *)
        echo "请输入正确的数字"
        ;;
    esac
                
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/main/scripts/server/mh_server.service  -O  /lib/systemd/system/mh_server.service        
    chmod +x /root/mh_server/*
    systemctl daemon-reload
    systemctl enable mh_server
    systemctl restart mh_server  &    
    echo "正在检查是否安装成功，请耐心等待1分钟稍......"
    sleep 30s
    check_done

}


  
clear

echo "======================================================="
echo "端对端加密隧道 - 解密端（服务端）- 一键安装工具 - 矿工之家 - minerhome.org"
echo "如果安装不成功，则重启服务器后重新安装"
echo "出现各种选择，请按 确认/OK"
echo "  1、安装(默认安装到/root/mh_server)"
echo "  2、卸载"
echo "  3、更新 - 未实现"
echo "  4、启动"
echo "  5、重启"
echo "  6、停止"
echo "  7、解除linux系统连接数限制(需要重启服务器生效)"
echo "  8、查看当前系统连接数限制"
echo "  9、重启服务器"
echo "======================================================="
read -p "$(echo -e "请选择[1-8]：")" choose
case $choose in
1)
    install
    ;;
2)
    uninstall
    ;;
3)
    update
    ;;
4)
    start
    ;;
5)
    restart
    ;;
6)
    stop
    ;;
7)
    change_limit
    ;;
8)
    check_limit
    ;;
9)
    reboot
    ;;
*)
    echo "输入错误请重新输入！"
    ;;
esac