controller="eosio.prods"

for account in 'eosio' 'eosio.bpay' 'eosio.vpay' 'eosio.msig' 'eosio.names' 'eosio.ram' 'eosio.ramfee' 'eosio.saving' 'eosio.stake' 'eosio.token' 'eosio.wrap' 'eosio.bios' 'eosio.faucet'
do
    cleos push action eosio updateauth '{"account": "'$account'", "permission": "owner",  "parent": "",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } } ' -p $account@owner
    cleos push action eosio updateauth '{"account": "'$account'", "permission": "active",  "parent": "owner",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "'$controller'", "permission": "active"} }] } }' -p $account@active
done