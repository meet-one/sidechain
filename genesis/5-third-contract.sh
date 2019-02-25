# 5. Deploy producers.m and proxies.m

cleos system newaccount eosio producers.m EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 --stake-net "1000.0000 MEETONE" --stake-cpu "1000.0000 MEETONE" --buy-ram "100.0000 MEETONE"
cleos system newaccount eosio proxies.m EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 EOS8iANEmGQ6ExAP22KF4vRu9hPvMNgHmVFyMMF5UspNMGzyukhV9 --stake-net "1000.0000 MEETONE" --stake-cpu "1000.0000 MEETONE" --buy-ram "100.0000 MEETONE"

cd ~
git clone https://github.com/meet-one/producerjson.git
cd producerjson
sh ./build.sh
cleos set contract producers.m ./ producerjson.wasm producerjson.abi -p producers.m@active

cd ~
git clone https://github.com/meet-one/eos-proxyinfo.git
cd eos-proxyinfo
sh ./build.sh
cleos set contract proxies.m ./ proxyinfo.wasm proxyinfo.abi -p proxies.m@active