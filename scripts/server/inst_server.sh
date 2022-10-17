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
    echo "mh_server 启动"
}

restart() {
    systemctl restart mh_server >> /dev/null
    echo "mh_server 重新启动" 
}

stop() {
    systemctl stop mh_server >> /dev/null
    echo "mh_server 停止" 
}


check_done() {
    if netstat -antpl | grep -q "12510"; then
        echo -e "\n\n" 
        echo -e "--------------------------------------------------------------------"
        echo -e "\n" 
        echo -e "安装成功， 端对端加密隧道流量混淆转发 - 解密端（服务端）- 已经在运行......" 
        echo -e "注意本地加密端的版本要对应!!! \n" 
        echo -e "详细用法请上网站查阅 https://minerhome.org/ \n" 
        echo -e "请重启服务器，必要时运行设置（使用相同的一键脚本） \n" 
        echo -e "\n" 
        echo -e "---------------------------------------------------------------------"
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
        echo "正在卸载......"
        systemctl stop mh_server  &
        systemctl disable mh_server  >> /dev/null
        rm -rf /root/mh_server
        echo "卸载完记得重启服务器"
}


install_common() {
    ufw disable
    $cmd update -y
    $cmd install wget -y
    $cmd install net-tools -y
}


install() {
    
    install_common
    
    rm -rf /root/mh_server
    mkdir /root/mh_server
    cd /root/mh_server

    clear
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo "请选择要安装的版本"
    echo "  1、v6.1.10 - 2022-10-17更新"
    echo "  2、v7.1.10 - 未更新"
    read -p "$(echo -e "请输入[1-4]：")" choose
    case $choose in
    1)
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v6.1.10/mh_server  -O  /root/mh_server/mh_server
        ;;
    2)
        wget  --no-check-certificate https://raw.githubusercontent.com/minerhome/mh_tunnel/main/releases/mh_server/v7.1.10/mh_server  -O  /root/mh_server/mh_server
        ;;

    *)
        echo "请输入正确的数字"
        ;;
    esac
                
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/main/scripts/server/run_mh_server.sh  -O  /root/mh_server/run_mh_server.sh
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/main/scripts/server/mh_server.service  -O  /lib/systemd/system/mh_server.service        
    
    chmod +x /root/mh_server/*
    systemctl daemon-reload
    systemctl enable mh_server  >> /dev/null
    systemctl restart mh_server  &    

    clear
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo "正在启动并检查是否安装成功，请耐心等待5分钟......"
    sleep 200s
    check_done

}

setup() {

    clear
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 
    echo -e "\n" 

    if [[ ! -d /root/mh_server ]]; then
        echo
        echo -e "请先安装再来设置"
        exit 1
    fi

    cd /root/mh_server
    wget  --no-check-certificate  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/server/server_setup   -O /root/mh_server/server_setup
    chmod +x /root/mh_server/*
    clear
    ./server_setup
}



  
clear
echo -e "\n" 
echo -e "\n" 
echo -e "\n" 
echo -e "\n" 
echo -e "\n" 
echo -e "\n" 
echo -e "\n" 
echo -e "\n" 
echo "================================================================================"
echo "端对端加密隧道流量混淆转发 - 解密端（服务端）- 一键安装工具 - 矿工之家https://minerhome.org"
echo "如果安装不成功，则重启服务器后重新安装"
echo "出现各种选择，请按 确认/OK"
echo "  1、安装(默认安装到/root/mh_server) - 安装完记得重启服务器 - 软件开机会自动启动，后台守护运行"
echo "  2、设置 - 开启各种币种，服务器重启频率"
echo "  3、卸载 - 卸载完记得重启服务器"
echo "  4、解除linux系统连接数限制 - 需要重启服务器生效"
echo "  5、查看当前系统连接数限制"
echo "  6、重启服务器"
echo "================================================================================"
read -p "$(echo -e "请选择[1-6]：")" choose
case $choose in
1)
    install
    ;;
2)
    setup
    ;;
3)
    uninstall
    ;;
4)
    change_limit
    ;;
5)
    check_limit
    ;;
6)
    reboot
    ;;
*)
    echo "输入错误请重新输入！"
    ;;
esac