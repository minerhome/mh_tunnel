# mh_tunnel 端对端加密隧道流量混淆

## 更新日志   （可加qq群交流:  171763813）
#### 2022-3-20  30g算力以上可以进群找群主领取低抽线路
#### 2022-3-19  默认为屏蔽内核抽水，也可以恢复内核抽水， 修改 nodevfee: 1 这个参数。为了安全起见，不要改动它。
#### 2022-3-20  增加了服务端，矿友可以自己搭建端对端的加密隧道了，再也不怕查水表了。可以用自己的服务器来中转，安全，稳定性更加有保障。建议使用阿里云香港服务器。
回想矿友的经历，从最开始的国内tcp直连，到ssl， 到国外矿池，到中转，一直到现在的端对端加密隧道。为了应对各种查水表，不停的升级我们的加密措施。
一句话，矿友真难。
今天，终于大家解放了。可以自己搭建专用的端对端加密隧道。目前最为安全。虽然损失一点点算力。


#### 2022-3-23  增加了ETC, BTC, ETH专业机，BTC建议在鱼池挖， 其它自己测试哪个池稳定。
#### 2022-3-27  自己搭建的也可以使用ETH专业机, BTC专业机, LTC专业机，以及ETC。如果连不上，可以换其它池试试。



# 一，搭建自己的解密服务器 - 服务端
建议选香港服务器， 可选阿里云的香港服务器。通过加密数据过来的，目前都不会查封。
优选ubuntu20.04版本
自己不搭建的话，就走矿工之家的公用线路。

```bash
# 可直连github的服务器 - 香港服务器上安装选这个
bash <(curl -s -L https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/server/inst_server.sh)

#  国内的选这个脚本
bash <(curl -s -L https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/server/inst_server_cdn.sh)

```
## 手动安装
```
cd /
rm -rf /root/mh_server
mkdir /root/mh_server
cd /root/mh_server
wget  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/mh_server/v1.0.0/config.yml   
wget  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/mh_server/v1.0.0/encrypt.yml  
wget  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/mh_server/v1.0.0/proxy_pools.yml  
wget  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/releases/mh_server/v1.0.0/mh_server
wget  https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/server/mh_server.service   

chmod 777 *
cp mh_server.service  /lib/systemd/system
systemctl daemon-reload
systemctl enable mh_server
重启即生效。
```



# 二， 安装加密混淆 - 本地端
主流币，主流池基本上都可以用。
ETH, ETC, LTC, BTC等不断增加，完善中。

### Windows 直接下载运行
进群下载。或者release里面下载。
下载后，双击 前台运行 那个文件就行。

### Liunx, ubuntu, debian, centos,  hiveos 基本上通用了。

```bash
# 可直连github的服务器
bash <(curl -s -L https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/tunnel/inst_tunnel.sh)

#  国内的选这个脚本
bash <(curl -s -L https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/inst_tunnel_cdn.sh)
```

安装之后自动在后台运行了。矿机只需连接该加密机器就行。


# 三，设置 - 本地端设置
### 本地加密走自己的解密服务器
#### 30g算力以上也可以找我领取低抽线路
没有设置则默认走矿工之家的默认公用服务器。如果你通过上一步已经自己搭建了一个加密服务器，则可以在这里设置。使本地的加密隧道走你自己的服务器。
#### 目前的设置选项有：
1，矿机是否开启屏蔽内核抽水   <br />
2, 矿机是否模拟正常上网          <br />
3，矿机是否使用自己的香港服务器ip         <br />
##### win的直接双击 设置 运行， linux的要输入以下命令
```bash
# 可直连github的服务器 - 香港服务器上安装选这个
bash <(curl -s -L https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/tunnel/setup.sh)

#  国内的选这个脚本
bash <(curl -s -L https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/setup_cdn.sh)
```


# 四，开始双向加密挖矿，不惧查水表。

如果是hiveos则可以每一台都安装一下。然后飞行表就写本机地址
如E池可以写
stratum+ssl://127.0.0.1:12510
各个挖矿软件的设置，可能是不一样的。参考各自说明。

<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/1.png"></img>
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/2.png"></img>

<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/3.png"></img>
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/4.png"></img>


# 五，检查有没有走自己的服务器

```
netstat -antpl | grep 12515
```
在服务器中运行这条命令，检查有没有走自己的服务器， 后面是矿机在用的端口号，如果显示 ESTABLISH 表示正在使用自己的服务器， 如果没有则是服务器没有搭好或者矿机，本地端没弄对。

<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/5.png"></img>

检测方法2，把自己的服务器关掉看矿机会不会掉线。如果掉线说明刚才用的是自己的服务器了。
恢复使用自己的服务器，先开服务器，等下再开本地隧道软件， 不然它又自动连到公用线路去了。


***
#### 联系我们
github:   https://github.com/minerhome/mh_tunnel<br />
油管：    https://www.youtube.com/channel/UC9TUiMp6Zg33x3PSNUlbVOw    <br />
网站：    https://minerhome.org<br />
QQ群：    171763813<br />
