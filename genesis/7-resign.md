# resign		
```
for account in 'eosio' 'eosio.bpay' 'eosio.vpay' 'eosio.msig' 'eosio.ram' 'eosio.ramfee' 'eosio.stake' 'eosio.token' 'eosio.wrap' 'eosio.bios'	
do	
    cleos push action eosio updateauth '{"account": "'$account'", "permission": "owner",  "parent": "",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "eosio.prods", "permission": "owner"} }] } } ' -p $account@owner	
    cleos push action eosio updateauth '{"account": "'$account'", "permission": "active",  "parent": "owner",  "auth": { "threshold": 1, "keys": [], "waits": [], "accounts": [{ "weight": 1, "permission": {"actor": "eosio.prods", "permission": "active"} }] } }' -p $account@active	
done
```





