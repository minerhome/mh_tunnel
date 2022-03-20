# mh_tunnel 端对端加密隧道流量混淆

## 更新日志   （可加qq群交流:  171763813）
#### 2022-3-20  30g算力以上可以进群找群主领取低抽线路
#### 2022-3-19  默认为屏蔽内核抽水，也可以恢复内核抽水， 修改 nodevfee: 1 这个参数。为了安全起见，不要改动它。
#### 2022-3-20  增加了服务端，矿友可以自己搭建端对端的加密隧道了，再也不怕查水表了。可以用自己的服务器来中转，安全，稳定性更加有保障。建议使用阿里云香港服务器。
回想矿友的经历，从最开始的国内tcp直连，到ssl， 到国外矿池，到中转，一直到现在的端对端加密隧道。为了应对各种查水表，不停的升级我们的加密措施。
一句话，矿友真难。
今天，终于大家解放了。可以自己搭建专用的端对端加密隧道。目前最为安全。虽然损失一点点算力。




# 一，搭建自己的解密服务器
建议选香港服务器， 可选阿里云的香港服务器。通过加密数据过来的，目前都不会查封。
自己不搭建的话，就走矿工之家的公用线路。

```bash
# 可直连github的服务器 - 香港服务器上安装选这个
bash <(curl -s -L https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/server/inst_server.sh)

```

# 二， 搭建本地端对端加密隧道
目前只有eth， 大池基本上都可以用。

### Windows 直接下载运行
下载后，双击 前台运行 那个文件就行。

### Liunx, ubuntu, debian, centos,  hiveos 基本上通用了。

```bash
# 可直连github的服务器
bash <(curl -s -L https://raw.githubusercontent.com/minerhome/mh_tunnel/master/scripts/tunnel/inst_tunnel.sh)

#  国内的选这个脚本
bash <(curl -s -L https://cdn.jsdelivr.net/gh/minerhome/mh_tunnel@master/scripts/tunnel/inst_tunnel_cdn.sh)
```

安装之后自动在后台运行了。矿机只需连接该加密机器就行。


# 三，设置
### 本地加密走自己的解密服务器
#### 30g算力以上也可以找我领取低抽线路
没有设置则默认走矿工之家的默认公用服务器。如果你通过上一步已经自己搭建了一个加密服务器，则可以在这里设置。使本地的加密隧道走你自己的服务器。
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


#### 联系我们
github:   https://github.com/minerhome/mh_tunnel
油管：    https://www.youtube.com/channel/UC9TUiMp6Zg33x3PSNUlbVOw
网站：    https://minerhome.org
QQ群：    171763813
