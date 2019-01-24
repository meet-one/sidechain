1. Install

```
cd ~
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

2. ABP launch nodeos

```
cd ~
mkdir nodeos/config-dir
mkdir nodeos/data-dir
mkdir shell
cd nodeos/config-dir
wget https://raw.githubusercontent.com/meet-one/sidechain/master/mainnet/config.ini
wget https://raw.githubusercontent.com/meet-one/sidechain/master/mainnet/genesis.json
cd ~/shell
nohup /usr/local/eosio/bin/nodeos --config-dir ~/nodeos/config-dir --data-dir ~/nodeos/data-dir --genesis-json ~/nodeos/config-dir/genesis.json  > log-nodeos.log 2>&1 &

```

3. Create eosio.*

```
cleos create account eosio eosio.token EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.msig EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.ram EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.ramfee EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.stake EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.bpay EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.vpay EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.wrap EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.bios EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
```

4. Deploy eosio.token, eosio.system, eosio.msig, eosio.wrap, eosio.bios

```
cd ~
git clone https://github.com/meet-one/eosio.contracts.git
cd eosio.contracts
git checkout meetone-sidechain-1.2

cd eosio.token/src
eosio-cpp -contract=eosio.token -abigen eosio.token.cpp -o eosio.token.wasm -I=/usr/local/include/ -I=../include
cleos set contract eosio.token ./ eosio.token.wasm eosio.token.abi -p eosio.token@active
cleos push action eosio.token create '[ "eosio", "10000000000.0000 MEETONE"]' -p eosio.token@active
cleos push action eosio.token issue '[ "eosio", "10000000000.0000 MEETONE", "memo" ]' -p eosio@active

cd ../../eosio.system/src
eosio-cpp -contract=eosio.system -abigen eosio.system.cpp -o eosio.system.wasm -I=/usr/local/include/ -I=../include -I=../../eosio.token/include
cleos set contract eosio ./ eosio.system.wasm eosio.system.abi -p eosio@active
cleos push action eosio setpriv '["eosio", 1]' -p eosio@active
cleos push action eosio init '[0,"4,MEETONE"]' -p eosio@active

cd ../../eosio.msig/src
eosio-cpp -contract=eosio.msig -abigen eosio.msig.cpp -o eosio.msig.wasm -I=/usr/local/include/ -I=../include
cleos set contract eosio.msig ./ eosio.msig.wasm eosio.msig.abi -p eosio.msig@active
cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active

cd ../../eosio.wrap/src
eosio-cpp -contract=eosio.wrap -abigen eosio.wrap.cpp -o eosio.wrap.wasm -I=/usr/local/include/ -I=../include
cleos set contract eosio.wrap /home/ubuntu/eosio.contracts/eosio.wrap eosio.wrap.wasm eosio.wrap.abi -p eosio.wrap@active
cleos push action eosio setpriv '["eosio.wrap", 1]' -p eosio@active

cd ../../eosio.bios/src
eosio-cpp -contract=eosio.bios -abigen eosio.bios.cpp -o eosio.bios.wasm -I=/usr/local/include/ -I=../include
cleos set contract eosio.bios ./ eosio.bios.wasm eosio.bios.abi -p eosio.bios@active
cleos push action eosio setpriv '["eosio.bios", 1]' -p eosio@active

```

5. Transfer MEETONE to *.m accounts

```
# transfer 500,000,000 MEETONE to eosio.vpay 
# transfer 500,000,000 MEETONE to eosio.bpay 
cleos push action eosio.token transfer '[ "eosio", "eosio.vpay", "500000000.0000 MEETONE", "" ]' -p eosio@active
cleos push action eosio.token transfer '[ "eosio", "eosio.bpay", "500000000.0000 MEETONE", "" ]' -p eosio@active

# transfer 1,500,000,000 MEETONE to foundation.m
cleos system newaccount m foundation.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos push action eosio.token transfer '[ "eosio", "m", "1499999790.0000 MEETONE", "" ]' -p eosio@active

# transfer 10,000,000 to m from foundation.m
cleos system newaccount foundation.m m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "100.0000 MEETONE" --stake-cpu "100.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos push action eosio.token transfer '[ "foundation.m", "m", "10000000.0000 MEETONE", "" ]' -p foundation.m@active
cleos push action eosio delegatebw '[ "m", "m", "500000.0000 MEETONE", "500000.0000 MEETONE", 1 ]' -p m@active

# delegatebw 2,500,000,000 MEETONE to meetone.m , frozen for 4 years
cleos system newaccount m meetone.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos push action eosio delegatebw '[ "eosio", "meetone.m", "1250000000.0000 MEETONE", "1250000000.0000 MEETONE", 1 ]' -p eosio@active

# transfer 5,000,000,000 MEETONE to bank.m
cleos system newaccount m bank.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "100.0000 MEETONE" --stake-cpu "100.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos push action eosio.token transfer '[ "eosio", "bank.m", "5000000000.0000 MEETONE", "" ]' -p eosio@active

# create accounts producers.m, proxies.m
cleos system newaccount m producers.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos system newaccount m proxies.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"

```

6. Deploy producers.m and proxies.m

```
# producers.m
git clone https://github.com/meet-one/producerjson.git
cd producerjson
sh ./build.sh
cleos set contract producers.m ./ producerjson.wasm producerjson.abi -p producers.m@active

# proxies.m
git clone https://github.com/meet-one/eos-proxyinfo.git
cd eos-proxyinfo
sh ./build.sh
cleos set contract proxies.m ./ eos-proxyinfo.wasm eos-proxyinfo.abi -p proxies.m@active
```

7. Syncing all accounts of EOS mainnet to sidechain (The new account name will be randomly 10 letters + .m)

```
cleos push action eosio.token transfer '[ "foundation.m", "eosio.m", "10000000.0000 MEETONE", "" ]' -p foundation.m@active
```

8. Syncing accounts *.m of EOS mainnet to sidechain (The account name are the same as the EOS mainnet)

9. Share the peer list and snapshot file to community, block producer candidate start to peer and register producer

10. Account m vote for registered block producer candidates to activated sidechain
 
 ```
 cleos system voteproducer prods m 
 ```

11. The eosio.* resign to eosio.prods

```
# resign

controller="eosio.prods"

for account in 'eosio' 'eosio.bpay' 'eosio.vpay' 'eosio.msig' 'eosio.ram' 'eosio.ramfee' 'eosio.stake' 'eosio.token' 'eosio.wrap' 'eosio.bios' 'eosio.m'
do
    cleos push action eosio updateauth '{"account": "'$account'", "permission": "owner",  "parent": "",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } } ' -p $account@owner
    cleos push action eosio updateauth '{"account": "'$account'", "permission": "active",  "parent": "owner",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } }' -p $account@active
done
```
 
12. Deploy contract bank.m to EOS mainnet

13. Done.
