
# 6. Deploy producers.m and proxies.m

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