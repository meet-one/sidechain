# 3. Create eosio.*

cd ~
cleos create account eosio eosio.token EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.msig EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.ram EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.ramfee EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.stake EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.bpay EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.vpay EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.wrap EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.bios EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN
cleos create account eosio eosio.m EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN EOS7enq7SL9AUhBYgkYMksj34LPKtAr7iu56KKrNTcUPTRqTp5VaN


# 4. Deploy eosio.token, eosio.system, eosio.msig, eosio.wrap, eosio.bios

cd ~
git clone https://github.com/meet-one/eosio.contracts.git
cd eosio.contracts
git checkout meetone-sidechain-1.2

cd eosio.token/src
eosio-cpp -contract=eosio.token -abigen eosio.token.cpp -o eosio.token.wasm -I=/usr/local/include/ -I=../include
cleos set contract eosio.token ./ eosio.token.wasm eosio.token.abi -p eosio.token@active
cleos push action eosio.token create '[ "eosio", "10000000000.0000 MEETONE"]' -p eosio.token@active
cleos push action eosio.token issue '[ "eosio", "10000000000.0000 MEETONE", "memo" ]' -p eosio@active

cd ../../eosio.system/src
eosio-cpp -contract=eosio.system -abigen eosio.system.cpp -o eosio.system.wasm -I=/usr/local/include/ -I=../include -I=../../eosio.token/include
cleos set contract eosio ./ eosio.system.wasm eosio.system.abi -p eosio@active
cleos push action eosio setpriv '["eosio", 1]' -p eosio@active
cleos push action eosio init '[0,"4,MEETONE"]' -p eosio@active

cd ../../eosio.msig/src
eosio-cpp -contract=eosio.msig -abigen eosio.msig.cpp -o eosio.msig.wasm -I=/usr/local/include/ -I=../include
cleos set contract eosio.msig ./ eosio.msig.wasm eosio.msig.abi -p eosio.msig@active
cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active

cd ../../eosio.wrap/src
eosio-cpp -contract=eosio.wrap -abigen eosio.wrap.cpp -o eosio.wrap.wasm -I=/usr/local/include/ -I=../include
cleos set contract eosio.wrap ./ eosio.wrap.wasm eosio.wrap.abi -p eosio.wrap@active
cleos push action eosio setpriv '["eosio.wrap", 1]' -p eosio@active

cd ../../eosio.bios/src
eosio-cpp -contract=eosio.bios -abigen eosio.bios.cpp -o eosio.bios.wasm -I=/usr/local/include/ -I=../include
cleos set contract eosio.bios ./ eosio.bios.wasm eosio.bios.abi -p eosio.bios@active
cleos push action eosio setpriv '["eosio.bios", 1]' -p eosio@active


echo "cleos get code eosio.token"
cleos get code eosio.token

echo "cleos get code eosio"
cleos get code eosio

echo "cleos get code eosio.msig"
cleos get code eosio.msig

echo "cleos get code eosio.wrap"
cleos get code eosio.wrap

echo "cleos get code eosio.bios"
cleos get code eosio.bios