
# 6. Deploy producers.m and proxies.m

cleos system newaccount m producers.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "1000.0000 MEETONE" --stake-cpu "1000.0000 MEETONE" --buy-ram "100.0000 MEETONE"
cleos system newaccount m proxies.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN --stake-net "1000.0000 MEETONE" --stake-cpu "1000.0000 MEETONE" --buy-ram "100.0000 MEETONE"

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