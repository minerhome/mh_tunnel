#!/bin/bash

[[ $(id -u) != 0 ]] && echo -e "请使用root权限运行安装脚本， 通过sudo su root切换再来运行" && exit 1

name = "端对端加密隧道流量混淆转发 - 加密端（本地端）"


cmd="apt-get"
if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
    if [[ $(command -v yum) ]]; then
        cmd="yum"
    fi
else
    echo "此脚本不支持该系统" && exit 1
fi


pid=`ps -ef | grep "mh_tunnel" |  awk '{print $2}'`
if [ -n "$pid" ]
then
	echo "kill running mh_tunnel $pid"
	kill -9 $pid
fi



check_done() {

    pid=`ps -ef | grep "12510" |  awk '{print $2}'`
    if [ -n "$pid" ]
    then
        echo -e "\n\n" 
        echo -e "--------------------------------------------------------"
        echo -e "\n" 
        echo -e "安装成功， 端对端加密隧道流量混淆转发 - 加密端（本地端）- 已经在运行......" 
        echo -e "详细用法请上 https://minerhome.org 网站查阅\n" 
        echo -e "\n" 
        echo -e "--------------------------------------------------------"
        echo -e "\n" 
    else        
        echo -e "\n\n" 
        echo "安装不成功，请重启后重新安装"   
        echo "出现各种选择，请按 确认/OK"
        echo -e "\n\n" 
    fi    


}

install() {
    
    # ufw disable
    # $cmd update -y

    $cmd install curl -y
    $cmd install wget -y
    $cmd install net-tools -y
        
    rm -rf /etc/rc.local
    rm -rf /root/mh_tunnel
    mkdir /root/mh_tunnel
    cd /root/mh_tunnel


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
    echo "  1、v4.0.0 - 稳定版"
    echo "  2、v5.0.0 - 测试版"
    echo "  3、v5.1.0 - 屏蔽抽水 - 凤凰内核v5.6~6.2(win+hiveos)，gminer-v2.90~v2.94(hiveos)"
    read -p "$(echo -e "请输入[1-2]：")" choose
    case $choose in
    1)
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/config.yml  -O /root/mh_tunnel/config.yml
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/encrypt.yml    -O /root/mh_tunnel/encrypt.yml
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/mh_tunnel    -O /root/mh_tunnel/mh_tunnel
        ;;
    2)
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v5.0.0/config.yml  -O /root/mh_tunnel/config.yml
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v5.0.0/encrypt.yml    -O /root/mh_tunnel/encrypt.yml
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v5.0.0/mh_tunnel    -O /root/mh_tunnel/mh_tunnel
        ;;
    3)
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v5.1.0/config.yml  -O /root/mh_tunnel/config.yml
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v5.1.0/encrypt.yml    -O /root/mh_tunnel/encrypt.yml
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v5.1.0/mh_tunnel    -O /root/mh_tunnel/mh_tunnel
        ;;
    *)
        echo "请输入正确的数字"
        ;;
    esac               

    wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/pools.txt    -O /root/mh_tunnel/pools.txt
    wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/httpsites.txt    -O /root/mh_tunnel/httpsites.txt
    wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/mh_tunnel.service    -O  /lib/systemd/system/mh_tunnel.service   
    wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/run_mh_tunnel.sh    -O /root/mh_tunnel/run_mh_tunnel.sh


    chmod +x /root/mh_tunnel/*
    systemctl daemon-reload
    systemctl enable mh_tunnel  >> /dev/null
    systemctl restart mh_tunnel  &    

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



uninstall() {    
        clear
        echo -e "\n" 
        echo -e "\n" 
        echo -e "\n" 
        echo -e "\n" 
        echo -e "\n" 
        echo "正在卸载......"
        systemctl stop mh_tunnel  &
        systemctl disable mh_tunnel  >> /dev/null
        rm -rf /root/mh_tunnel
        rm -rf /lib/systemd/system/mh_tunnel.service
        echo "卸载完记得重启"
}




setup_cdn() {

    cd /root/mh_tunnel   
    wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/mh_setup  -O /root/mh_tunnel/mh_setup
    chmod +x /root/mh_tunnel/*
    ./mh_setup
}





clear
echo -e "\n" 
echo -e "\n" 
echo -e "\n" 
echo -e "\n" 
echo -e "\n" 
echo "========================================================================================="
echo "端对端加密隧道流量混淆转发 - 加密端（本地端）- hiveos/ubuntu/debian 一键安装工具 - 矿工之家 - https://minerhome.org"
echo "默认安装到 /root/mh_tunnel"
echo "如果安装不成功，则重启服务器后重新安装"
echo "出现各种选择，请按 确认/OK"
echo "  1、安装(默认安装到/root/mh_tunnel) - 安装完记得重启服务器 - 软件开机会自动启动，后台守护运行"
echo "  2、设置 - 指定走专线服务器，模拟上网，听音乐，看视频等"
echo "  3、卸载 - 删除本软件"
echo "  6、重启电脑"
echo "========================================================================================="
read -p "$(echo -e "请选择[1-4]：")" choose
case $choose in
1)
    install
    ;;
2)
    setup_cdn
    ;;
3)
    uninstall
    ;;    
6)
    reboot
    ;;
*)
    echo "输入错误请重新输入！"
    ;;
esac


