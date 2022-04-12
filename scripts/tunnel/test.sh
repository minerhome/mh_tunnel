
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
        echo -e "安装成功，端对端加密隧道 - 加密端（本地端）- 已经在运行......" 
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

setup() {
    cd /root/mh_tunnel   
    wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/mh_setup  -O /root/mh_tunnel/mh_setup
    chmod +x /root/mh_tunnel/*
    ./mh_setup
}




install_2 () {

        $cmd install wget -y
        $cmd install net-tools -y
            
            
        rm -rf /root/mh_tunnel
        mkdir /root/mh_tunnel
        cd /root/mh_tunnel

        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/config.yml
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/encrypt.yml
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/mh_tunnel
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/rc.local -O /etc/rc.local

        # wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/mh_tunnel.service
        # wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/run_mh_tunnel.sh

        chmod +x /root/mh_tunnel/*


        # rm -rf /etc/rc.local
        # cat >> /etc/rc.local << EOF
        # #!/bin/bash
        # ##!/bin/sh -e
        # cd /root/mh_tunnel
        # nohup /root/mh_tunnel/mh_tunnel &
        # exit 0
        # EOF

        chmod +x /etc/rc.local
        # reboot
        bash /etc/rc.local
        echo "正在启动加密隧道......"
        sleep 10s
        check_done


}



install () {

        $cmd install wget -y
        $cmd install net-tools -y
            
        rm -rf  /etc/rc.local
        rm -rf  /lib/systemd/system/mh_tunnel.service
        rm -rf  /root/mh_tunnel
        mkdir   /root/mh_tunnel
        cd      /root/mh_tunnel

        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/config.yml  -O  ~/mh_tunnel/config.yml
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/encrypt.yml  -O  ~/mh_tunnel/encrypt.yml
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/mh_tunnel   -O  ~/mh_tunnel/mh_tunnel
        # wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/rc.local -O /etc/rc.local
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/mh_tunnel.service  -O  /lib/systemd/system/mh_tunnel.service
        wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/run_mh_tunnel.sh    -O  ~/mh_tunnel/run_mh_tunnel.sh

        chmod +x /root/mh_tunnel/*


        # rm -rf /etc/rc.local
        # cat >> /etc/rc.local << EOF
        # #!/bin/bash
        # ##!/bin/sh -e
        # cd /root/mh_tunnel
        # nohup /root/mh_tunnel/mh_tunnel &
        # exit 0
        # EOF

        # chmod +x /etc/rc.local
        # reboot
        # bash /etc/rc.local

        echo "正在启动加密隧道......"       
        systemctl daemon-reload    
        systemctl enable mh_tunnel    >> /dev/null
        systemctl restart mh_tunnel  &
        sleep 10s
        check_done

}


uninstall() {
        echo "卸载加密隧道......"
        rm -rf /root/mh_tunnel
        echo "卸载成功。记得重启"
}



install_b() {

    # ufw disable
    # $cmd update -y
    $cmd install wget -y
    $cmd install net-tools -y
        
        
    rm -rf /root/mh_tunnel
    mkdir /root/mh_tunnel
    cd /root/mh_tunnel

    wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/config.yml
    wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/encrypt.yml
    wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/releases/mh_tunnel/v4.1.0/mh_tunnel
    # wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/mh_tunnel.service
    # wget  --no-check-certificate   https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/run_mh_tunnel.sh
 
    chmod +x /root/mh_tunnel/*
    
    if [[ -f /lib/systemd/system/mh_tunnel.service ]]; then        
        systemctl stop mh_tunnel
        systemctl disable mh_tunnel
        rm -rf /lib/systemd/system/mh_tunnel.service
    fi
    # mv /root/mh_tunnel/mh_tunnel.service  /lib/systemd/system/
    # systemctl enable mh_tunnel
    # systemctl restart mh_tunnel
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
echo "========================================================================"
echo "端对端加密隧道 - 加密端（本地端）- hiveos 一键安装工具 - 矿工之家 - minerhome.org"
echo "如果安装不成功，则重启服务器后重新安装"
echo "出现各种选择，请按 确认/OK"
echo "  1、安装(默认安装到/root/mh_tunnel) - 安装完记得重启 - 开机会自动启动，后台守护运行"
echo "  2、卸载 - 卸载完记得重启"
echo "  3、设置"
echo "  4、重启服务器"
echo "========================================================================"
read -p "$(echo -e "请选择[1-4]：")" choose
case $choose in
1)
    install
    ;;
2)
    uninstall
    ;;
3)
    setup
    ;;
4)
    reboot
    ;;
*)
    echo "输入错误请重新输入！"
    ;;
esac
















 



