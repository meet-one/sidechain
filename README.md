# MEET.ONE Sidechain 

[Technical White Paper](./technical-white-paper-EN.md)

[技术白皮书](./technical-white-paper-CN.md)

Telegram group for sidechain: [https://t.me/joinchat/Gwj0R0uBIT3w4a3GSGu9pg](https://t.me/joinchat/Gwj0R0uBIT3w4a3GSGu9pg)

Sidechain explorer: [EOSX for MEET.ONE](https://meetone.eosx.io/) & [Bloks for MEET.ONE](https://meetone.bloks.io/)

[Developer Portal](https://developers.eos.io)

[Step-by-step guide to learning eosjs API for integration with EOSIO-based blockchains](https://github.com/meet-one/eosjs-guide)

[History API Documentation](https://documenter.getpostman.com/view/3895747/S11Ey1cw)

[Hyperion History API](https://meetone.hyperion.eosrio.io/v2/docs/index.html)

[Sidechain Testnet](https://github.com/meet-one/sidechain/blob/master/testnet.md)

Blockchain state snapshot: [Snapshot list](https://storage.googleapis.com/meetone-snapshot-backups/)

Blockchain blocks snapshot: [Blocks List](https://storage.googleapis.com/meetone-block-backups/)

[Source code of system contracts](https://github.com/meet-one/eosio.contracts/tree/meetone-1.0)

[Source code of eosio](https://github.com/meet-one/eos)

[MEET.ONE sidechain mainnet status monitor](https://t.me/meetonemainnetstatus)

[Click me to transfer MEETONE token from EOS mainnet to MEET.ONE sidechain](https://github.com/meet-one/bank.m)

[MEETONE sidechain launch schedule](./launch-schedule.md)


System requirements for nodeos: 4 CPU, 16 GB RAM


Chain id:

```
cfe6486a83bad4962f232d48003b1824ab5665c36778141034d75e57b956e422
```

Genesis json:

```
wget https://raw.githubusercontent.com/meet-one/sidechain/master/genesis/config-dir/genesis.json
``` 

P2P list:
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
p2p-peer-address = 47.244.154.93:9876
p2p-peer-address = 47.244.152.44:9876
p2p-peer-address = 47.244.141.55:9876
p2p-peer-address = meetone.genereos.io:19876
p2p-peer-address = meetone.seed1.eosdublin.io:9876
```

API list:
```
https://fullnode.meet.one/v1/chain/get_info
https://api.meetone.eostribe.io/v1/chain/get_info
https://meetseed.ikuwara.com:8889/v1/chain/get_info
https://api.meetone.alohaeos.com/v1/chain/get_info
https://meetone.eossweden.eu/v1/chain/get_info
http://api-meetone.eossf.net:8888/v1/chain/get_info
https://meetone.eosphere.io/v1/chain/get_info
https://meetone.eosn.io/v1/chain/get_info
https://meetone.eosargentina.io/v1/chain/get_info
```

### Register block producer info

Opensource contract [producerjson](https://github.com/greymass/producerjson) from greymass was depolyed to producers.m, this contract stores bp.json on chain.

get bp list:
```
cleos -u https://fullnode.meet.one get table producers.m producers.m producerjson
```

submit bp info: (Please make sure your BP is registered as active and vote_weight is not 0.)
```
cleos -u https://fullnode.meet.one push action producers.m set '{"owner":"meetone.m", "json": "{\"producer_account_name\":\"meetone.m\",\"org\":{\"candidate_name\":\"MEET.ONE\",\"website\":\"https://meet.one\",\"ownership_disclosure\":\"https://steemit.com/eos/@meetone/meet-one-statement-of-ownership\",\"code_of_conduct\":\"https://steemit.com/eos/@meetone/revenue-distribution-of-meet-one\",\"email\":\"hello@meet.one\",\"branding\":{\"logo_256\":\"https://meet.one/meetone-256.png\",\"logo_1024\":\"https://meet.one/meetone-1024.png\",\"logo_svg\":\"https://meet.one/assets/MEET.svg\"},\"location\":{\"name\":\"Singapore\",\"country\":\"SG\",\"latitude\":1.290270,\"longitude\":103.851959},\"social\":{\"steemit\":\"meetone\",\"twitter\":\"MeetDotOne\",\"github\":\"meet-one\",\"telegram\":\"MeetOne\"}},\"nodes\":[{\"location\":{\"name\":\"HongKong\",\"country\":\"CN\",\"latitude\":22.28552,\"longitude\":114.15769},\"node_type\":\"seed\",\"p2p_endpoint\":\"peer1.meet.one:9876\"},{\"location\":{\"name\":\"HongKong\",\"country\":\"CN\",\"latitude\":22.28552,\"longitude\":114.15769},\"node_type\":\"seed\",\"p2p_endpoint\":\"peer2.meet.one:9876\"},{\"location\":{\"name\":\"HongKong\",\"country\":\"CN\",\"latitude\":22.28552,\"longitude\":114.15769},\"node_type\":\"seed\",\"p2p_endpoint\":\"peer3.meet.one:9876\"},{\"location\":{\"name\":\"HongKong\",\"country\":\"CN\",\"latitude\":22.28552,\"longitude\":114.15769},\"node_type\":\"full\",\"api_endpoint\":\"http://fullnode.meet.one\",\"ssl_endpoint\":\"https://fullnode.meet.one\"},{\"location\":{\"name\":\"HongKong\",\"country\":\"CN\",\"latitude\":22.28552,\"longitude\":114.15769},\"node_type\":\"producer\"}]}"}' -p meetone.m@active
```

### Register proxy info

Opensource contract [eos-proxyinfo](https://github.com/AlohaEOS/eos-proxyinfo) from AlohaEOS was depolyed to proxies.m, this contract stores proxy info on chain.

get proxy list:
```
cleos -u https://fullnode.meet.one get table proxies.m proxies.m proxies
```

submit proxy info:
```
cleos -u https://fullnode.meet.one push action proxies.m set '["proxy.m","MEET.ONE Proxy","MEET.ONE connecting users","Community Engagement,Technical Proficiency,Building Tools/Dapps for the Community,Education,Cooperation,Geographical location.","MEET.ONE is an EOS block producer candidate from Singapore. On June 15, 2018, MEET.ONE was successfully elected as one of genesis block producers.MEET.ONE is committed to the development of EOS ecology portal applications. In the past few months, MEET.ONE has offered the majority of the users outstanding EOS portal presentations to realize various functions of the EOS ecosystem. At the same time, we have established a huge EOS community and designed a series of incentive mechanisms to enable the community members to actively study, enlarge the EOS ecology and build a solid foundation of consent;In the future, we will initiate the MEET.ONE side chain, set up a foundation to screen and incubate outstanding Dapps in the EOS ecosystem, and become an incubator and filter for the EOS application ecology.Becoming a block producer was just the beginning. MEET.ONE never stopped its progress. We will contribute all our strength and work with EOS supporters around the world to build a healthy EOS ecosystem.","https://meet.one","https://raw.githubusercontent.com/meet-one/website/master/meetone-256.png","https://t.me/MeetOneEnglish","https://steemit.com/@meetone","https://twitter.com/MeetDotOne",""]' -p proxy.m
```
