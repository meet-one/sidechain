# MEET.ONE Sidechain 

[Technical White Paper](./technical-white-paper-EN.md)

[技术白皮书](./technical-white-paper-CN.md)

[Join Testnet](./testnet.md)

Telegram group for sidechain: [https://t.me/joinchat/Gwj0R0uBIT3w4a3GSGu9pg](https://t.me/joinchat/Gwj0R0uBIT3w4a3GSGu9pg)

MEET.ONE Sidechain

Chain Id:

```
cfe6486a83bad4962f232d48003b1824ab5665c36778141034d75e57b956e422
```

Genesis Json:

```
wget https://raw.githubusercontent.com/meet-one/sidechain/master/genesis/config-dir/genesis.json
``` 

```
{
  "initial_timestamp": "2019-02-24T08:08:08.888",
  "initial_key": "EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9",
  "initial_configuration": {
    "max_block_net_usage": 1048576,
    "target_block_net_usage_pct": 1000,
    "max_transaction_net_usage": 524288,
    "base_per_transaction_net_usage": 12,
    "net_usage_leeway": 500,
    "context_free_discount_net_usage_num": 20,
    "context_free_discount_net_usage_den": 100,
    "max_block_cpu_usage": 200000,
    "target_block_cpu_usage_pct": 1000,
    "max_transaction_cpu_usage": 150000,
    "min_transaction_cpu_usage": 100,
    "max_transaction_lifetime": 3600,
    "deferred_trx_expiration_window": 600,
    "max_transaction_delay": 3888000,
    "max_inline_action_size": 4096,
    "max_inline_action_depth": 4,
    "max_authority_depth": 6
  }
}
```

P2P List:
```
p2p-peer-address = peer1.meet.one:9876
p2p-peer-address = peer2.meet.one:9876
p2p-peer-address = peer3.meet.one:9876
p2p-peer-address = peer1-meetone.eosphere.io:9876
p2p-peer-address = meetone.eossweden.eu:8062
p2p-peer-address = p2p-meetone.eosbeijing.one:6003
p2p-peer-address = p2p.meetone.nytelos.com:8012
p2p-peer-address = peer.meetone.alohaeos.com:9876
p2p-peer-address = meetone.eosnairobi.io:9676
p2p-peer-address = p2p-meetone.eossv.org:446
p2p-peer-address = meetone.eosargentina.io:9876
p2p-peer-address = p2p.meetone.eclipse24.io:9876
p2p-peer-address = p2p-meetone.blckchnd.com:9876
p2p-peer-address = meetone.eosvenezuela.io:9876
p2p-peer-address = one-p2p.infinitybloc.io:9876
p2p-peer-address = meetone.eosio.sg:9875
p2p-peer-address = p2p-meetone.eossf.net:9876
p2p-peer-address = www.blockbp.com:9875
p2p-peer-address = www.dzbbp.com:9875
p2p-peer-address = meetone.acroeos.one:9876
p2p-peer-address = p2p-meetone.goingos.org:9876
p2p-peer-address = meetone.atticlab.net:6667
p2p-peer-address = meetone.nodepacific.com:9876
p2p-peer-address = meetone.eostribe.io:9878
p2p-peer-address = meetseed.ikuwara.com:9876
p2p-peer-address = p2p.meetone.fy.xyz:9876
p2p-peer-address = node-meetone.starteos.io:9876
p2p-peer-address = meetone.eoscannon.io:19876
p2p-peer-address = meetone.p2p.blockgo.vip:9899
p2p-peer-address = 13.230.195.142:1234
p2p-peer-address = meetone.eosn.io:9876
```

API List:
```
https://fullnode.meet.one/v1/chain/get_info
https://api.meetone.eostribe.io/v1/chain/get_info
https://meetseed.ikuwara.com:8889/v1/chain/get_info
https://api.meetone.alohaeos.com/v1/chain/get_info
https://meetone.eossweden.eu/v1/chain/get_info
http://api-meetone.eossf.net:8888/v1/chain/get_info
https://meetone.eosphere.io/v1/chain/get_info
https://meetone.eosn.io/v1/chain/get_info
```

Blockchain State Snapshot:

[Snapshot list](https://storage.googleapis.com/eos-snapshot-backups/)

Blockchain Blocks Snapshot:

[Blocks List](https://storage.googleapis.com/eos-block-backups/)



## MEET.ONE sidechain production launch schedule:

### 19/02/2019 4:00 (GMT)  
#### Snapshot of EOS mainnet.

### 26/02/2019 13:00 (GMT) MEET.ONE online.
#### Genesis BP launch MEET.ONE production sidechain. [more details](./genesis) 
#### Genesis BP share the peer node address, full node address, sidechain state snapshot file, genesis.json to the community.
#### BPs start to connect to sidechain network, register block producer and get votes.
#### Opensource contract [producerjson](https://github.com/greymass/producerjson) from greymass will deploy to producers.m, this contract stores bp.json on chain.
#### Opensource contract [eos-proxyinfo](https://github.com/AlohaEOS/eos-proxyinfo) from AlohaEOS will depoly to proxies.m, this contract stores proxy info on chain.
#### MEET.ONE wallet turns on MEET.ONE sidechain option.
#### MEET.ONE wallet users can start to activate MEET.ONE sidechain accounts.
#### MEET.ONE token holder starts to migrate tokens from EOS mainnet to MEET.ONE sidechain.

### 27/02/2019 13:00 (GMT) MEET.ONE activated.
#### Sidechain activated.
#### Top 21 BPs start producing blocks.
#### MEET.ONE team deploy Airgrab contract to the sidechain. [Sourcecode of Airgrab](https://github.com/meet-one/sidechain-airgrab)
#### All sidechain accounts can Airgrab their token.

### 07/03/2019 Airdrop 
#### MEET.ONE team airdrop tokens to Accounts.


## MEET.ONE 侧链主网启动流程:

### 2019-02-19 10:00:00 (UTC+8) 
#### 进行 EOS 主网快照.

### 2019-02-26 21:00:00 (UTC+8) MEET.ONE 上线
#### Genesis BP 启动侧链主网. [更多细节](./genesis)
#### Genesis BP 对外公布 peer 节点地址, 全节点地址, 区块快照文件, genesis.json. 
#### 超级节点开始同步区块, 注册 BP 信息, 从社区拿到投票.
#### [producerjson](https://github.com/greymass/producerjson) 合约将会被部署到 producers.m 账号，该合约用于在链上保存 bp.json.
#### [eos-proxyinfo](https://github.com/AlohaEOS/eos-proxyinfo) 合约将会被部署到 proxies.m 账号，该合约用于在链上保存投票代理信息.
#### MEET.ONE 钱包开放侧链模块.
#### MEET.ONE 钱包用户开始激活侧链账户.
#### MEET.ONE token 持有者开始从主网将代币迁移至侧链.

### 2019-02-27 21:00:00 (UTC+8) MEET.ONE 激活
#### 侧链正式激活.
#### 前 21 名超级节点开始出块.
#### MEET.ONE 团队在侧链部署 airgrab 合约.[Airgrab源代码](https://github.com/meet-one/sidechain-airgrab)
#### 所有侧链用户开始 airgrab 空投的 token。

### 2019-03-07 空投.
#### MEET.ONE 团队对 airgrab 合约中的账户进行空投.
