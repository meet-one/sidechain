# 2. ABP launch nodeos

cd ~
mkdir nodeos
mkdir nodeos/config-dir
mkdir nodeos/data-dir
mkdir shell
cd nodeos/config-dir
wget https://raw.githubusercontent.com/meet-one/sidechain/master/mainnet/config.ini
wget https://raw.githubusercontent.com/meet-one/sidechain/master/mainnet/genesis.json
cd ~/shell
nohup /usr/local/eosio/bin/nodeos --config-dir ~/nodeos/config-dir --data-dir ~/nodeos/data-dir --genesis-json ~/nodeos/config-dir/genesis.json  > log-nodeos.log 2>&1 &