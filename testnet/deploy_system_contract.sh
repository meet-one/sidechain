cleos set contract eosio ../eosio.system -p eosio@active
cleos set contract eosio.msig ../eosio.msig -p eosio.msig@active
cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active


cleos set contract eosio.token ../eosio.token -p eosio.token@active
cleos push action eosio.token create '[ "eosio", "10000000000.0000 MEETONE"]' -p eosio.token@active
cleos push action eosio.token issue '[ "eosio", "10000000000.0000 MEETONE", "memo" ]' -p eosio@active
cleos push action eosio.token transfer '[ "eosio", "eosio.faucet", "10000000.0000 MEETONE", "" ]' -p eosio@active
cleos get currency balance eosio.token eosio
cleos get currency balance eosio.token eosio.faucet


cleos push action eosio init '[0,"4,MEETONE"]' -p eosio@active

