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





cleos system newaccount eosio meetone111.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone112.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone113.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone114.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone115.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone121.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone122.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone123.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone124.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone125.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone131.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone132.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone133.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone134.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone135.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone141.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone142.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone143.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone144.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone145.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone151.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone152.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone153.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone154.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"
cleos system newaccount eosio meetone155.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "50 MEETONE" --stake-cpu "50 MEETONE" --buy-ram "100 MEETONE"