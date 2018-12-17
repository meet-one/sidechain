
cleos set contract eosio.token ./ eosio.token.wasm eosio.token.abi -p eosio.token@active
cleos push action eosio.token create '[ "eosio", "10000000000.0000 MEETONE"]' -p eosio.token@active
cleos push action eosio.token issue '[ "eosio", "10000000000.0000 MEETONE", "memo" ]' -p eosio@active
cleos push action eosio.token transfer '[ "eosio", "eosio.faucet", "10000000.0000 MEETONE", "" ]' -p eosio@active
cleos push action eosio.token transfer '[ "eosio", "m", "90000000.0000 MEETONE", "" ]' -p eosio@active
cleos get currency balance eosio.token eosio
cleos get currency balance eosio.token eosio.faucet


cleos set contract eosio ./ eosio.system.wasm eosio.system.abi -p eosio@active
cleos push action eosio setpriv '["eosio.wrap", 1]' -p eosio@active
cleos push action eosio init '[0,"4,MEETONE"]' -p eosio@active

cleos set contract eosio.msig ./ eosio.msig.wasm eosio.msig.abi -p eosio.msig@active
cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active


cleos set contract eosio.bios ./ eosio.bios.wasm eosio.bios.abi -p eosio.bios@active
cleos push action eosio setpriv '["eosio.bios", 1]' -p eosio@active
cleos push action eosio.bios setprods '{"schedule": [{"producer_name": "meetonetest1", "block_signing_key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"},{"producer_name":"meetonetest2", "block_signing_key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"},,{"producer_name":"meetonetest3", "block_signing_key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"},{"producer_name":"meetonetest4", "block_signing_key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"},{"producer_name":"meetonetest5", "block_signing_key":"EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"}]}' -p eosio.bios@active