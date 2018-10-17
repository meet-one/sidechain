# MEET.ONE Sidechain Testnet

#### These are test only keys and should never be used for the production blockchain. 

Private key: EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

Public key: 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3


## Basic Info

```
1. Core system symbol: MEETONE
2. Total supply: 10000000000.0000
```

## P2P LIST

```
p2p-peer-address = testnet.meet.one:9876
```

## BNET LIST

```
bnet-connect = testnet.meet.one:4321
```

## HTTPS API LIST

```
https://api-testnet.meet.one/v1/chain/get_info
```

## Chain info

```
{
  "chain_id": "9b21092f2e09cffdb32ffe513a358942d76733ff611fabd9847fcb64ece5c927"
}
```


## For Block Producers: Join blockchain network to producing


### Step 1. Install
```
git clone https://github.com/meet-one/eos.git
cd eos
git checkout meetone-sidechain
git submodule update --init --recursive
./eosio_build.sh -s MEETONE
sudo ./eosio_install.sh
```


### Step 2. Create new account

```
http://35.221.207.136:6677/newaccount?name=testnet115.m
```


### Step 3. Configure the initial set of nodeos

```
1. open your config.ini 
2. replace producer-name to your producer name 
3. replace signature-provider to your produce public key and private key
4. add p2p/bnet node address
```

### Step 4. Launch the node

```
nodeos --data-dir ./nodeos/producer-node/data-dir --config-dir ./nodeos/producer-node/config-dir --genesis-json ./nodeos/producer-node/config-dir/genesis.json
```

### Step 5. Register block producer info

```
cleos system regproducer meetone111.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN http://meet.one 702
```

### Step 6. Get vote.


## For EOS Developers: [https://developers.eos.io](https://developers.eos.io)

### Create new account

```
http://35.221.207.136:6677/newaccount?name=testnet115.m
```

#### The new account will have 1000 MEETONE token, you can get 1000 more if you want.

```
http://35.221.207.136:6677/get_token?name=testnet115.m
```
