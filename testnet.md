# MEET.ONE Sidechain Testnet

### For DApp Developers: [https://developers.eos.io](https://developers.eos.io)

#### Create new account

```
http://35.236.182.224:6677/newaccount?name=testnet111.m
```

#### Get 1000 MEETONE.

```
http://35.236.182.224:6677/get_token?name=testnet111.m
```

### Browser

Sidechain browser.

[EOSX for sidechain testnet](https://meetone-test.eosx.io/)


### Basic info

```
1. Core system symbol: MEETONE
2. Total supply: 10,000,000,000.0000
```

### P2P list

```
p2p-peer-address = 95.179.135.231:9876
p2p-peer-address = 108.61.144.245:8012
p2p-peer-address = 95.216.114.172:9876
p2p-peer-address = peer-meetone.starteos.io:9876
p2p-peer-address = meetone.eosn.io:9876
p2p-peer-address = peer.meetonetest.alohaeos.com:9876
p2p-peer-address = meetone-testnet.eosphere.io:9876
p2p-peer-address = sidechain-test.meet.one:9874
p2p-peer-address = sidechain-test.meet.one:9875
p2p-peer-address = sidechain-test.meet.one:9876
```


### HTTP API list

```
http://sidechain-test.meet.one:8888/v1/chain/get_info
https://meetone-testnet.eosphere.io/v1/chain/get_info
http://95.179.135.231:8888/v1/chain/get_info
http://95.216.114.172:8888/v1/chain/get_info
```

### Chain id

```
{
  "chain_id": "7136e3e32a458bb99cf6973ab5055869d25830607b9e78593769e1be52fb6f20"
}
```


### Join sidechain testnet

[config.ini](https://github.com/meet-one/sidechain/blob/master/testnet/nodeos/producer-node/config-dir/config.ini)

[genesis.json](https://github.com/meet-one/sidechain/blob/master/testnet/nodeos/producer-node/config-dir/genesis.json)


```
wget https://raw.githubusercontent.com/meet-one/sidechain/master/testnet/nodeos/producer-node/config-dir/config.ini
wget https://raw.githubusercontent.com/meet-one/sidechain/master/testnet/nodeos/producer-node/config-dir/genesis.json
```

#### These are test only keys and should never be used for the production blockchain. 

Public key: EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

Private key: 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

Testnet machine: 2 CPU, 8GB RAM

#### Step 1. Install
```
git clone https://github.com/meet-one/eos.git
cd eos
git checkout tags/v1.6.0
git submodule update --init --recursive
./eosio_build.sh -s MEETONE
cd build
sudo make install
echo 'PATH=$PATH:/usr/local/eosio/bin/' >> ~/.bashrc
source ~/.bashrc
```


#### Step 2. Create new account

```
http://35.236.182.224:6677/newaccount?name=testnet115.m
```


#### Step 3. Configure the initial set of nodeos

```
1. open config.ini 
2. replace producer-name to block producer name 
3. replace signature-provider to produce public key and private key
4. add p2p node address
```

#### Step 4. Launch the node

```
nodeos --data-dir ./nodeos/producer-node/data-dir --config-dir ./nodeos/producer-node/config-dir --genesis-json ./nodeos/producer-node/config-dir/genesis.json
```

#### Step 5. Get vote.

### Register block producer info

Opensource contract [producerjson](https://github.com/greymass/producerjson) from greymass was depolyed to producers.m, this contract stores bp.json on chain.

get bp list:
```
cleos -u http://sidechain-test.meet.one:8888 get table producers.m producers.m producerjson
```

submit bp info:
```
cleos -u http://sidechain-test.meet.one:8888 push action producers.m set '{"owner":"meetone1.m", "json": "{\"producer_account_name\":\"meetone1.m\",\"org\":{\"candidate_name\":\"MEET.ONE\",\"website\":\"https://meet.one\",\"ownership_disclosure\":\"https://steemit.com/eos/@meetone/meet-one-statement-of-ownership\",\"code_of_conduct\":\"https://steemit.com/eos/@meetone/revenue-distribution-of-meet-one\",\"email\":\"hello@meet.one\",\"branding\":{\"logo_256\":\"https://meet.one/meetone-256.png\",\"logo_1024\":\"https://meet.one/meetone-1024.png\",\"logo_svg\":\"https://meet.one/assets/MEET.svg\"},\"location\":{\"name\":\"Singapore\",\"country\":\"SG\",\"latitude\":1.29027,\"longitude\":103.851959},\"social\":{\"steemit\":\"meetone\",\"twitter\":\"MeetDotOne\",\"github\":\"meet-one\",\"telegram\":\"MeetOne\"}},\"nodes\":[{\"location\":{\"name\":\"Taiwan\",\"country\":\"CN\",\"latitude\":23.553118,\"longitude\":121.0211024},\"node_type\":\"seed\",\"p2p_endpoint\":\"p2p.meet.one:9876\"},{\"location\":{\"name\":\"Taiwan\",\"country\":\"CN\",\"latitude\":23.553118,\"longitude\":121.0211024},\"node_type\":\"full\",\"api_endpoint\":\"http://mainnet.meet.one\",\"ssl_endpoint\":\"https://mainnet.meet.one\"},{\"location\":{\"name\":\"Taiwan\",\"country\":\"CN\",\"latitude\":23.553118,\"longitude\":121.0211024},\"node_type\":\"producer\"}]}"}' -p meetone1.m@active
```

### Register proxy info

Opensource contract [eos-proxyinfo](https://github.com/AlohaEOS/eos-proxyinfo) from AlohaEOS was depolyed to proxies.m, this contract stores proxy info on chain.

get proxy list:
```
cleos -u http://sidechain-test.meet.one:8888 get table proxies.m proxies.m proxies
```

submit proxy info:
```
cleos -u http://sidechain-test.meet.one:8888 push action proxies.m set '["proxy.m","MEET.ONE Proxy","MEET.ONE connecting users","Community Engagement,Technical Proficiency,Building Tools/Dapps for the Community,Education,Cooperation,Geographical location.","MEET.ONE is an EOS block producer candidate from Singapore. On June 15, 2018, MEET.ONE was successfully elected as one of genesis block producers.MEET.ONE is committed to the development of EOS ecology portal applications. In the past few months, MEET.ONE has offered the majority of the users outstanding EOS portal presentations to realize various functions of the EOS ecosystem. At the same time, we have established a huge EOS community and designed a series of incentive mechanisms to enable the community members to actively study, enlarge the EOS ecology and build a solid foundation of consent;In the future, we will initiate the MEET.ONE side chain, set up a foundation to screen and incubate outstanding Dapps in the EOS ecosystem, and become an incubator and filter for the EOS application ecology.Becoming a block producer was just the beginning. MEET.ONE never stopped its progress. We will contribute all our strength and work with EOS supporters around the world to build a healthy EOS ecosystem.","https://meet.one","https://raw.githubusercontent.com/meet-one/website/master/meetone-256.png","https://t.me/MeetOneEnglish","https://steemit.com/@meetone","https://twitter.com/MeetDotOne",""]' -p proxy.m
```

