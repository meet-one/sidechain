# 5. Transfer MEETONE to *.m accounts

cd ~

cleos system newaccount eosio foundation.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "10.0000 MEETONE" --stake-cpu "10.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos system newaccount eosio m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "10.0000 MEETONE" --stake-cpu "10.0000 MEETONE" --buy-ram "10.0000 MEETONE"

cleos transfer eosio foundation.m 2489999920.0000 MEETONE
cleos system delegatebw foundation.m foundation.m "10000 MEETONE" "10000 MEETONE"

cleos transfer foundation.m eosio.vpay "500000000.0000 MEETONE" ""
cleos transfer foundation.m eosio.bpay "500000000.0000 MEETONE" ""

cleos transfer foundation.m m "10000000.0000 MEETONE"
cleos system delegatebw m m "50000 MEETONE" "50000 MEETONE"

cleos system newaccount eosio meetone.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos system delegatebw eosio meetone.m "1250000000.0000 MEETONE" "1250000000.0000 MEETONE" 1
cleos push action eosio delegatebw '["eosio","meetone.m","1250000000.0000 MEETONE","1250000000.0000 MEETONE",1]' -p eosio

cleos system newaccount eosio bank.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos transfer eosio bank.m "5000000000.0000 MEETONE"
cleos system delegatebw foundation.m bank.m "100000.0000 MEETONE" "1000000.0000 MEETONE"