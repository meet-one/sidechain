# 4. Transfer MEETONE to *.m accounts

cd ~

cleos system newaccount eosio foundation.m EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 --stake-net "10.0000 MEETONE" --stake-cpu "10.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos system newaccount eosio m EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 --stake-net "10.0000 MEETONE" --stake-cpu "10.0000 MEETONE" --buy-ram "10.0000 MEETONE"

cleos transfer eosio foundation.m "2499995720.0000 MEETONE"

cleos system newaccount eosio meetone.m EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos push action eosio delegatebw '["eosio","meetone.m","1250000000.0000 MEETONE","1250000000.0000 MEETONE",1]' -p eosio

cleos system newaccount eosio bank.m EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"
cleos transfer eosio bank.m "5000000000.0000 MEETONE"

cleos system newaccount eosio bank.error.m EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 --stake-net "0.0000 MEETONE" --stake-cpu "0.0000 MEETONE" --buy-ram "10.0000 MEETONE"


cleos system delegatebw foundation.m foundation.m "10000 MEETONE" "10000 MEETONE"

cleos transfer foundation.m eosio.vpay "500000000.0000 MEETONE" ""
cleos transfer foundation.m eosio.bpay "500000000.0000 MEETONE" ""

cleos transfer foundation.m m "10000000.0000 MEETONE"
cleos system delegatebw m m "50000 MEETONE" "50000 MEETONE"

cleos system delegatebw foundation.m bank.m "100000.0000 MEETONE" "1000000.0000 MEETONE"




cleos get currency balance eosio.token meetone.m
cleos get currency balance eosio.token foundation.m
cleos get currency balance eosio.token bank.m
cleos get currency balance eosio.token eosio.bpay
cleos get currency balance eosio.token eosio.vpay


