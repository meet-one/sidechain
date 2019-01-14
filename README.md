# MEET.ONE Sidechain 

## Initial accounts

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
m
meetone.m
bank.m
foundation.m
```

## Initial contracts

```
eosio.system
eosio.token
eosio.msig
eosio.wrap
eosio.bios
bank.m
```

## Block producer candidate

```
EOSNation
EOSPark
MEET.ONE
```

## Snapshot

Get synced to the network within a minute.

## Monitor

Sidechain monitoring tool.

## Browser

Sidechain browser.

## Wallet

MEET.ONE Wallet APP.


## Testnet

#### These are test only keys and should never be used for the production blockchain. 

Public key: EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

Private key: 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3


### Basic info

```
1. Core system symbol: MEETONE
2. Total supply: 10,000,000,000.0000
```

### P2P list

```
p2p-peer-address = sidechain-test.meet.one:9876
p2p-peer-address = sidechain-test2.meet.one:9876
```


### HTTP API list

```
http://sidechain-test.meet.one:8888/v1/chain/get_info
http://sidechain-test2.meet.one:8888/v1/chain/get_info
```

### History node list (filter-on = *)

```
http://sidechain-test-history.meet.one:8888/v1/chain/get_info
```

### Chain id

```
{
  "chain_id": "7136e3e32a458bb99cf6973ab5055869d25830607b9e78593769e1be52fb6f20"
}
```


### Join test blockchain network

[config.ini](https://github.com/meet-one/sidechain/blob/master/testnet/nodeos/producer-node/config-dir/config.ini)

[genesis.json](https://github.com/meet-one/sidechain/blob/master/testnet/nodeos/producer-node/config-dir/genesis.json)


```
wget https://raw.githubusercontent.com/meet-one/sidechain/master/testnet/nodeos/producer-node/config-dir/config.ini
wget https://raw.githubusercontent.com/meet-one/sidechain/master/testnet/nodeos/producer-node/config-dir/genesis.json
```

Testnet machine: 4 CPU, 8GB RAM

#### Step 1. Install
```
git clone https://github.com/meet-one/eos.git
cd eos
git checkout tags/v1.5.3
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
http://35.236.182.224:6677/newaccount?name=testnet111.m
```

#### Get 1000 MEETONE.

```
http://35.236.182.224:6677/get_token?name=testnet111.m
```
