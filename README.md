# mh_tunnel 端对端加密隧道流量混淆

目前已支持 ETH, ETC, LTC, BTC, ERGO, TON， 显卡机， 专业机都支持。

## 更新日志   （可加qq群交流:  920966691 ）
#### 2022-3-20  30g算力以上可以进群找群主领取低抽线路
#### 2022-3-19  默认为屏蔽内核抽水，也可以恢复内核抽水， 修改 nodevfee: 1 这个参数。为了安全起见，不要改动它。
#### 2022-3-20  增加了服务端，矿友可以自己搭建端对端的加密隧道了，再也不怕查水表了。可以用自己的服务器来中转，安全，稳定性更加有保障。建议使用阿里云香港服务器。
回想矿友的经历，从最开始的国内tcp直连，到ssl， 到国外矿池，到中转，一直到现在的端对端加密隧道。为了应对各种查水表，不停的升级我们的加密措施。
一句话，矿友真难。
今天，终于大家解放了。可以自己搭建专用的端对端加密隧道。目前最为安全。虽然损失一点点算力。


#### 2022-3-23  增加了ETC, BTC, ETH专业机，BTC建议在鱼池挖， 其它自己测试哪个池稳定。
#### 2022-3-27  自己搭建的也可以使用ETH专业机, BTC专业机, LTC专业机，以及ETC。如果连不上，可以换其它池试试。
#### 2022-3-31  本地端可以限制只走专用的IP， 要不要自动切换到矿工之家公用线路由自己决定。
#### 2022-3-31  修改hiveos安装方法，现在hiveos可以正常使用了。
接下来就是增加服务端的稳定性。
#### 2022-4-5  增加了服务端的稳定性
#### 2022-4-5  增加了ergo, ton  
#### 2022-4-24  开启抽水功能。帮朋友搭建也可以抽水了。
#### 2022-5-6  完善内核屏蔽， 完善模拟正常上网行为，可以设置模拟浏览网页，模拟听歌，模拟看视频， 并可设置混淆强度，以节省流量。
#### 2022-5-14 明确内核抽水屏蔽干净的目前两个，凤凰v5.6-v6.2， win或hiveos都行。 gminer v2.90-2.94只在hiveos测试成功。


# 一，搭建自己的解密服务器 - 服务端 - （这一步是可选的，使用自己的服务器才要做这一步）
建议选香港服务器， 可选阿里云的香港服务器, 一般要2H2G。通过加密数据过来的，目前都不会查封。
ubuntu 18 或 20 版本， 其它系统未经测试
自己不搭建的话，就走矿工之家的公用线路。
#### 记得要进后台打开防火墙啊。把所有的端口都放行。

&nbsp; 香港服务器上执行一键安装脚本 - 包括安装，设置，删除，建议安装完成之后设置一下，只打开自己有用到的币种。
```
bash <(curl -s -L https://raw.githubusercontent.com/minerhome/mh_tunnel/main/scripts/server/inst_server.sh)
```

&nbsp; 如果没法执行就手动安装 - 两行命令
```
wget  https://raw.githubusercontent.com/minerhome/mh_tunnel/main/scripts/server/inst_server.sh -O inst_server.sh
bash inst_server.sh
```


#### 然后重启服务器 - 可到后面第5步去检查安装成功了没有。


# 二， 安装加密混淆 - 本地端 - （这一步是必须的）
######  可以每台都安装，也可以在局域网中同一个交换机出来的只安装一台，然后其它矿机来连接它。
主流币，主流池基本上都可以用。
ETH, ETC, LTC, BTC, ERGO, TON等不断增加，完善中。

### Windows 直接下载运行 - 建议使用windows版本
进群下载。或者release里面下载。
下载后，双击 前台运行 那个文件就行。

### Liunx, ubuntu, debian, centos,  hiveos 基本上通用了。- 包括安装，设置，删除

#  一键安装 - 尽量选这个，多安装几次一般会成功
```bash
bash <(curl -s -L https://raw.githubusercontent.com/minerhome/mh_tunnel/main/scripts/tunnel/inst_tunnel.sh)
```

#  上面实在没办法安装就选这个脚本 
```bash
bash <(curl -s -L down.minerhome.org/mh_tunnel/scripts/tunnel/inst_tunnel_cn.sh)
```

#  不行还可以手动安装 
```bash
wget down.minerhome.org/mh_tunnel/scripts/tunnel/inst_tunnel_cn.sh  -O inst_tunnel_cn.sh
bash inst_tunnel_cn.sh
```


#### 重启机器即可

安装之后自动在后台运行了。矿机只需连接该加密机器就行。

#### 检查一下hiveos安装成功了没
```
netstat -anptl | grep 12510
如果看到有信息，LISTEN 或 ESTABLISHED 就说明成功了。
```
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/6.png"></img>



# 三，设置 - 本地端设置 - （这一步是可选的， 只有在第一步搭建自己的服务器或者找群主拿专用地址才需要这一步。）
### 本地加密走自己的解密服务器
#### 30g算力以上也可以找我领取低抽线路
没有设置则默认走矿工之家的默认公用服务器。如果你通过上一步已经自己搭建了一个加密服务器，则可以在这里设置。使本地的加密隧道走你自己的服务器。
#### 目前的设置选项有：
1，矿机是否开启屏蔽内核抽水   <br />
2, 矿机是否模拟正常上网，模拟听歌，模拟看视频，以及混淆强度。          <br />
3，矿机是否使用自己的香港服务器ip         <br />
##### win 下载后，解压，里面就有 “设置” 这个命令。
##### linux的要输入以下命令， 运行相同的一键脚本命令，选择设置。
```bash
还是用上面的一键安装脚本。
```


# 四，开始双向加密挖矿，不惧查水表。 （这一步是必须的）

如果是hiveos则可以每一台都安装一下。然后飞行表就写本机地址
###### 如E池可以写
###### 127.0.0.1:12510   上面勾上SSL Urls
###### 127.0.0.1:12515   不必勾上SSL
###### 各个挖矿软件的设置，可能是不一样的。参考各自说明。

<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/1.png"></img>
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/7.png"></img>
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/8.png"></img>
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/9.png"></img>
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/11.png"></img>
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/2.png"></img>
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/12.png"></img>
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/13.png"></img>
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/3.png"></img>
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/22.png"></img>
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/4.png"></img>
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/14.png"></img>

开源矿工中凤凰的用法 - 隧道
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/20.png"></img>
开源矿工中凤凰的用法 - SSL直连
<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/21.png"></img>


# 五，检查有没有走自己的服务器 -（这一步是可选的）

```
netstat -antpl | grep 12515
```
在服务器中运行这条命令，看提示。如果没有任何反应，说明服务端没有安装成功。
##### 如果有显示 LISTEN       说明安装成功了
##### 如果有显示 ESTABLISHED  并且端口号是在左边，说明矿机已经连上了

测试的时候，先用E池来测试，成功了再换其它池。有的池子没有开通。

<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/5.png"></img>

检测方法2，把自己的服务器关掉看矿机会不会掉线。如果掉线说明刚才用的是自己的服务器了。
恢复使用自己的服务器，先开服务器，等下再开本地隧道软件， 不然它又自动连到公用线路去了。

# 六，开启抽水功能
#### 客户端 - 矿机用法一样，要设置一下，让矿机走你的这台服务器的IP（运行上面的一键脚本去设置IP）
#### 服务端 - 修改服务端的配置文件。-- 服务端跟客户端的版本要对应.
打开抽水功能。修改配置文件   /root/mh_server/config.yml   </br >
dev_worker: "minerhome"  -  抽水矿工名称  </br >
devfee:         - 抽水设置
    - port: 12630   - 要抽水的端口, 不写表示不抽
      type: ethw    - etc, ethw, eth,  erg, rvn, eth
      fee: 0        -  抽多少, 0表示不抽
      wallet: "0xab47ef096164cD35430e78F22fe837F10592c214"    - 抽水钱包, 开抽水一定要写钱包

    - port: 14881   - 要抽水的端口
      type: btc     - etc, ethw, erg, rvn, eth
      fee: 0        -  抽多少, 0表示不抽
      wallet: viponedream    -  抽水钱包, 开抽水一定要写钱包

    - port: 16500
      fee: 0
      type: kaspa        - 目前kasps抽水不太稳定
      devpool: ""
      wallet: kaspa:qqz9yn23pm76spac30mmtyg48encg40zusxe92ccvnwm2djps5l52cyw8r0t6



# 七，最佳做法
##### 经测试，一台专门的win10电脑来运行加密隧道软件，而其它矿机来连这一台电脑，用专用的线路，则比较稳定。群友稳定好多天了。
##### hiveos系统是精简版的，建议安装只作为屏蔽内核抽水之用。专门找一台win10来运行给其它矿机使用。以后需要升级，更新，只需要在win10电脑上操作就行了，而矿机不用动。只有当需要屏蔽内核抽水的时候才需要重新安装一下。
##### 一句话，目前win10来运行加密隧道软件比较稳定。

<img src="https://raw.githubusercontent.com/minerhome/mh_tunnel/master/images/19.png"></img>

************************************************************
#### 联系我们
github:  https://github.com/minerhome/mh_tunnel<br />
油管：    https://www.youtube.com/channel/UC9TUiMp6Zg33x3PSNUlbVOw    <br />
网站：    https://minerhome.org<br />
QQ群：    171763813<br />
电报群:   https://t.me/minerhomeorg
