0. EOS 主网准备工作

```
创建多签账户 bank.m
将 MEETONE 基金会 25 亿 MEETONE 转入 bank.m
```

1. 安装侧链环境

```
git clone https://github.com/meet-one/eos.git
cd eos
git checkout tags/v1.6.0
git submodule update --init --recursive
./eosio_build.sh -s MEETONE
cd build
sudo make install
echo 'PATH=$PATH:/usr/local/eosio/bin/' >> ~/.profile
source ~/.profile
```

2. ABP 启动侧链 (genesis.json, config.ini)

[config.ini](https://raw.githubusercontent.com/meet-one/sidechain/master/mainnet/config.ini)
[genesis.json](https://raw.githubusercontent.com/meet-one/sidechain/master/mainnet/genesis.json)

```
wget https://raw.githubusercontent.com/meet-one/sidechain/master/mainnet/config.ini
wget https://raw.githubusercontent.com/meet-one/sidechain/master/mainnet/genesis.json
```

3. 创建 10 个系统账号 eosio.*

```
eosio
eosio.token
eosio.msig
eosio.ram
eosio.ramfee
eosio.stake
eosio.bpay
eosio.vpay
eosio.wrap
eosio.bios
eosio.m
```

4. 部署系统合约、系统 TOKEN 合约、多签合约、BIOS 合约、WRAP 合约

```
eosio.system (diff: rewards, bid,refundbid, meetone.m unstake, activated 0.01%, create newaccount)
eosio.token
eosio.msig
eosio.wrap
eosio.bios
```

5. 创建侧链账号且转出 MEETONE

```
# 转出 10 亿 MEETONE 到节点奖励账户
cleos push action eosio.token transfer '[ "eosio", "eosio.vpay", "500000000.0000 MEETONE", "" ]' -p eosio@active
cleos push action eosio.token transfer '[ "eosio", "eosio.bpay", "500000000.0000 MEETONE", "" ]' -p eosio@active

# 创建基金会账户, 且转入 15 亿 MEETONE
cleos system newaccount m foundation.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos push action eosio.token transfer '[ "eosio", "m", "1499999790.0000 MEETONE", "" ]' -p eosio@active

# 创建 MEETONE 团队账户, 且抵押 25 亿 MEETONE, 全部解除抵押需要 4 年, 冻结代码在系统合约可以查阅 
cleos system newaccount m meetone.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos push action eosio delegatebw '[ "eosio", "meetone.m", "1250000000.0000 MEETONE", "1250000000.0000 MEETONE", 1 ]' -p eosio@active

# 创建跨链转币账户 bank.m, 且转入 50 亿 MEETONE
cleos system newaccount m bank.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "100.0000 MEETONE" --stake-cpu "100.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos push action eosio.token transfer '[ "eosio", "bank.m", "5000000000.0000 MEETONE", "" ]' -p eosio@active

# 创建 m 账户, 且转入 1 亿 MEETONE
cleos system newaccount eosio m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "100.0000 MEETONE" --stake-cpu "100.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos push action eosio.token transfer '[ "foundation.m", "m", "10000000.0000 MEETONE", "" ]' -p eosio@active

# 创建 producers.m, proxies.m 账户
cleos system newaccount m producers.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos system newaccount m proxies.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"

```

6. 部署侧链合约

```
producers.m
proxies.m
```

7. 准备空投账户 eosio.m, 转入 1 千万 MEETONE 用于同步主网账户以及抵押 CPU、NET

```
cleos push action eosio.token transfer '[ "foundation.m", "eosio.m", "10000000.0000 MEETONE", "" ]' -p eosio@active
```

8. 同步主网 *.m 账号, 主网 60 万账户同步至侧链(.m结尾,前面十位字符随机生成, NET: 1 MEETONE, CPU: 9 MEETONE), Top 50 节点账户名需要提前在主网生成, 更换成团队名称的短域名(eosnation.m, meetone.m, eosasia.m)

9. ABP 公布 peer 地址, 提供 snapshot 下载地址, 超级节点开始同步数据, 注册BP信息准备出块。

10. m 账户投票(抵押 1 百万 MEETONE), 侧链激活, 超级节点开始出块
 
 ```
 cleos system delegatebw m m "500000.0000 MEETONE" "500000.0000 MEETONE"
 ```

11. 10 个系统账户权限 resign 给超级节点 (eosio.prods)

```
# resign

controller="eosio.prods"

for account in 'eosio' 'eosio.bpay' 'eosio.vpay' 'eosio.msig' 'eosio.ram' 'eosio.ramfee' 'eosio.stake' 'eosio.token' 'eosio.wrap' 'eosio.bios' 'eosio.m'
do
    cleos push action eosio updateauth '{"account": "'$account'", "permission": "owner",  "parent": "",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } } ' -p $account@owner
    cleos push action eosio updateauth '{"account": "'$account'", "permission": "active",  "parent": "owner",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } }' -p $account@active
done
```
 
12. 部署 MEETONE 跨链迁移合约 bank.m

```
bank.m
```

13. 区块浏览器开始接入

14. 钱包上线侧链模块
