# launch testnet nodeos

nohup /usr/local/eosio/bin/nodeos --config-dir /home/ubuntu/nodeos/eosio/config-dir --data-dir /home/ubuntu/nodeos/eosio/data-dir --genesis-json /home/ubuntu/nodeos/eosio/config-dir/genesis.json > log-eosio.log 2>&1 &

nohup /usr/local/eosio/bin/nodeos --config-dir /home/ubuntu/nodeos/meetone1.m/config-dir --data-dir /home/ubuntu/nodeos/meetone1.m/data-dir --genesis-json /home/ubuntu/nodeos/meetone1.m/config-dir/genesis.json > log-1.log 2>&1 &

nohup /usr/local/eosio/bin/nodeos --config-dir /home/ubuntu/nodeos/meetone2.m/config-dir --data-dir /home/ubuntu/nodeos/meetone2.m/data-dir --genesis-json /home/ubuntu/nodeos/meetone2.m/config-dir/genesis.json > log-2.log 2>&1 &

nohup /usr/local/eosio/bin/nodeos --config-dir /home/ubuntu/nodeos/meetone3.m/config-dir --data-dir /home/ubuntu/nodeos/meetone3.m/data-dir --genesis-json /home/ubuntu/nodeos/meetone3.m/config-dir/genesis.json > log-3.log 2>&1 &

nohup /usr/local/eosio/bin/nodeos --config-dir /home/ubuntu/nodeos/meetone4.m/config-dir --data-dir /home/ubuntu/nodeos/meetone4.m/data-dir --genesis-json /home/ubuntu/nodeos/meetone4.m/config-dir/genesis.json > log-4.log 2>&1 &

nohup /usr/local/eosio/bin/nodeos --config-dir /home/ubuntu/nodeos/meetone5.m/config-dir --data-dir /home/ubuntu/nodeos/meetone5.m/data-dir --genesis-json /home/ubuntu/nodeos/meetone5.m/config-dir/genesis.json > log-5.log 2>&1 &


# create system account

cleos create account eosio eosio.bpay EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.vpay EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.msig EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.ram EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.ramfee EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.stake EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.token EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.wrap EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.bios EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.faucet EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN


# deploy token contract

cleos set contract eosio.token /home/ubuntu/eosio.contracts/eosio.token/src eosio.token.wasm eosio.token.abi -p eosio.token@active
cleos push action eosio.token create '[ "eosio", "10000000000.0000 MEETONE"]' -p eosio.token@active
cleos push action eosio.token issue '[ "eosio", "10000000000.0000 MEETONE", "memo" ]' -p eosio@active


# deploy system contract

cleos set contract eosio /home/ubuntu/eosio.contracts/eosio.system/src eosio.system.wasm eosio.system.abi -p eosio@active
cleos push action eosio setpriv '["eosio", 1]' -p eosio@active
cleos push action eosio init '[0,"4,MEETONE"]' -p eosio@active


# deploy msig contract

cleos set contract eosio.msig /home/ubuntu/eosio.contracts/eosio.msig eosio.msig.wasm eosio.msig.abi -p eosio.msig@active
cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active


# deploy bios contract

cleos set contract eosio.bios /home/ubuntu/eosio.contracts/eosio.bios eosio.bios.wasm eosio.bios.abi -p eosio.bios@active
cleos push action eosio setpriv '["eosio.bios", 1]' -p eosio@active


# deploy wrap contract

cleos set contract eosio.wrap /home/ubuntu/eosio.contracts/eosio.wrap eosio.wrap.wasm eosio.wrap.abi -p eosio.wrap@active
cleos push action eosio setpriv '["eosio.wrap", 1]' -p eosio@active


# create accounts of meetone team

cleos system newaccount eosio m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "100.0000 MEETONE" --stake-cpu "100.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos push action eosio.token transfer '[ "eosio", "m", "99999790.0000 MEETONE", "" ]' -p eosio@active
cleos system newaccount m bank.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "100.0000 MEETONE" --stake-cpu "100.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos system newaccount m meetone.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos system newaccount m foundation.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"


cleos system newaccount m producers.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos system newaccount m proxies.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos system newaccount m proxy.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"


# transfer token from eosio to m & faucet

cleos push action eosio.token transfer '[ "eosio", "foundation.m", "1500000000.0000 MEETONE", "" ]' -p eosio@active
cleos push action eosio.token transfer '[ "eosio", "eosio.bpay", "500000000.0000 MEETONE", "" ]' -p eosio@active
cleos push action eosio.token transfer '[ "eosio", "eosio.vpay", "500000000.0000 MEETONE", "" ]' -p eosio@active
cleos push action eosio delegatebw '[ "eosio", "meetone.m", "1250000000.0000 MEETONE", "1250000000.0000 MEETONE", 1 ]' -p eosio@active
cleos push action eosio.token transfer '[ "eosio", "bank.m", "7299999790.0000 MEETONE", "" ]' -p eosio@active

cleos get currency balance eosio.token eosio
cleos get currency balance eosio.token eosio.faucet
cleos get currency balance eosio.token m
cleos get currency balance eosio.token bank.m
cleos get currency balance eosio.token meetone.m
cleos get currency balance eosio.token foundation.m


# create testnet account

for account in 'meetone1.m' 'meetone2.m' 'meetone3.m' 'meetone4.m' 'meetone5.m' 'meetone11.m' 'meetone22.m' 'meetone33.m' 'meetone44.m' 'meetone55.m' 'meetonea.m' 'meetoneb.m' 'meetonec.m' 'meetoned.m' 'meetonee.m' 'meetonef.m' 'meetoneg.m' 'meetoneh.m' 'meetonei.m' 'meetonej.m' 'meetonek.m' 'meetonel.m' 'meetonem.m' 'meetonen.m' 'meetoneo.m' 'meetonep.m' 'meetoneq.m' 'meetoner.m' 'meetones.m' 'meetonet.m'
do
    cleos system newaccount m $account EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "10.0000 MEETONE" --stake-cpu "10.0000 MEETONE" --buy-ram "10.0000 MEETONE"
done



# register block producer

for account in 'meetone1.m' 'meetone2.m' 'meetone3.m' 'meetone4.m' 'meetone5.m' 'meetone11.m' 'meetone22.m' 'meetone33.m' 'meetone44.m' 'meetone55.m' 'meetonea.m' 'meetoneb.m' 'meetonec.m' 'meetoned.m' 'meetonee.m' 'meetonef.m' 'meetoneg.m' 'meetoneh.m' 'meetonei.m' 'meetonej.m' 'meetonek.m' 'meetonel.m' 'meetonem.m' 'meetonen.m' 'meetoneo.m' 'meetonep.m' 'meetoneq.m' 'meetoner.m' 'meetones.m' 'meetonet.m'
do
    cleos system regproducer $account EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN https://meet.one 702
done



# set producers

cleos push action eosio.bios setprods '{"schedule": [{"producer_name": "meetone1.m", "block_signing_key":"EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN"},{"producer_name":"meetone2.m", "block_signing_key":"EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN"},,{"producer_name":"meetone3.m", "block_signing_key":"EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN"},{"producer_name":"meetone4.m", "block_signing_key":"EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN"},{"producer_name":"meetone5.m", "block_signing_key":"EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN"}]}' -p eosio.bios@active


# resign

controller="eosio.prods"

for account in 'eosio' 'eosio.bpay' 'eosio.vpay' 'eosio.msig' 'eosio.ram' 'eosio.ramfee' 'eosio.stake' 'eosio.token' 'eosio.wrap' 'eosio.bios'
do
    cleos push action eosio updateauth '{"account": "'$account'", "permission": "owner",  "parent": "",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } } ' -p $account@owner
    cleos push action eosio updateauth '{"account": "'$account'", "permission": "active",  "parent": "owner",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } }' -p $account@active
done