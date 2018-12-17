# MEET.ONE Sidechain 

## Dev Tutorial

![image](MEET.ONE-Sidechain.001.jpeg)

## 用户体系

### 公私钥

每一位开发者都至少要有一对公私钥，公钥可以对外公开，私钥必须妥善保管，如果私钥被泄露要及时更换。开发者可以通过以下两种方式创建公私钥对:

[cleos create key](https://developers.eos.io/eosio-cleos/reference#cleos-create-key)

[eosjs create key](https://github.com/EOSIO/eosjs-ecc#randomkey)

### 账户名/竞拍

开发者可以免费创建 12 位的用户名，也可以参与竞拍少于 12 位的账户名。允许 a-z, 1-5 的字符。

[创建 12 位账户名](https://developers.eos.io/eosio-cleos/reference#cleos-create-account)

[竞拍小于 12 位的账户名](https://developers.eos.io/eosio-cleos/reference#cleos-system-bidname)

### 多签

如果开发者有多人管理同一个账户的需求，比如团队的账号，必须由多个团队成员一起授权才可以进行交易或者其他操作，请参照以下教程完成设置。

[Multisig Tutorial](https://steemit.com/eos/@genereos/eos-multisig-tutorial)


## 开发工具

### cleos 

cleos 是给开发者们提供的命令行工具，通过 cleos 可以与节点进行通信。

[Cleos Overview](https://developers.eos.io/eosio-nodeos/docs/cleos-overview)

### eosio.cdt

eosio.cdt 是给开发者们提供的合约开发工具，它会编译你开发的智能合约源代码，输出 WebAssembly 格式文件 *.wasm 以及 *.abi 文件，当你需要在 nodeos 测试合约或者正式发布合约时，节点都只接收 *.wasm & *.abi 文件。

[EOSIO.CDT (Contract Development Toolkit)](https://github.com/EOSIO/eosio.cdt)

### eosjs

eosjs 是给开发者们提供的 JavaScript 开发工具，你可以通过它与节点通信。

[Javascript library for the EOS blockchain](https://github.com/EOSIO/eosjs/tree/v16.0.9)

### keosd

keosd 是给开发者们提供的私钥管理工具，一般与 cleos 配套使用。

[Keosd Introduction](https://developers.eos.io/keosd/docs/)

### 插件

目前的插件都是给 nodeos 使用的，有 block.one 开发的也有社区开发的。

[EOSIO Plugins](https://developers.eos.io/eosio-nodeos/docs/mongo_db_plugin)


## 基础服务

### 智能合约

[Smart Contract Introduction](https://developers.eos.io/eosio-cpp/docs)

### 数据存储

[Multi-Index DB API](https://developers.eos.io/eosio-cpp/docs/db-api)

### 节点 API

## 运营监控

### 节点监控/异常告警

针对出块节点的一系列监控与告警服务。

### 数据可视化

数据统计与分析。

### 区块快照

我们将会提供定期更新的 blocks/snapshots 快照文件，方便开发者快速部署自己的 fullnode/API node。

## Testnet

#### These are test only keys and should never be used for the production blockchain. 

Private key: EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

Public key: 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3


### Basic info

```
1. Core system symbol: MEETONE
2. Total supply: 10000000000.0000
```

### P2P list

```
p2p-peer-address = sidechain-test.meet.one:9876
```


### HTTPS API list

```
http://sidechain-test.meet.one:8888/v1/chain/get_info
```

### Chain info

```
{
  "chain_id": "399836e9894b222eb95063a5442069882e40abec832b89d8e3b4f4456de2bb7d"
}
```


### For Block Producers: Join blockchain network to producing


#### Step 1. Install
```
git clone https://github.com/meet-one/eos.git
cd eos
git submodule update --init --recursive
./eosio_build.sh -s MEETONE
cd build
sudo make install
echo 'PATH=$PATH:/usr/local/eosio/bin/' >> ~/.profile
source ~/.profile 
```


#### Step 2. Create new account

```
http://35.236.182.224:6677/newaccount?name=testnet115.m
```


#### Step 3. Configure the initial set of nodeos

```
1. open your config.ini 
2. replace producer-name to your producer name 
3. replace signature-provider to your produce public key and private key
4. add p2p/bnet node address
```

#### Step 4. Launch the node

```
nodeos --data-dir ./nodeos/producer-node/data-dir --config-dir ./nodeos/producer-node/config-dir --genesis-json ./nodeos/producer-node/config-dir/genesis.json
```


### For EOS Developers: [https://developers.eos.io](https://developers.eos.io)

#### Create new account

```
http://35.236.182.224:6677/newaccount?name=testnet11111
```

#### The new account will have 1000 MEETONE token, you can get 1000 more if you want.

```
http://35.236.182.224:6677/get_token?name=testnet11111
```


## 接入 MEET.ONE 钱包

[EOS 生态可能因此大爆发,使用门槛被极大降低](https://mp.weixin.qq.com/s/4m0ZhJP1itlhH3rabYhcAg)

[别看了，这篇是写给 EOS 应用开发者的](https://mp.weixin.qq.com/s/vZhJGP-0grJHLCOsljhZSA)
