# 2. Genesis BP launch nodeos

cd ~
rm -rf nodeos
mkdir nodeos
mkdir nodeos/config-dir
mkdir nodeos/data-dir
mkdir shell
cd nodeos/config-dir
wget https://raw.githubusercontent.com/meet-one/sidechain/master/genesis/config-dir/config.ini
wget https://raw.githubusercontent.com/meet-one/sidechain/master/genesis/config-dir/genesis.json
cd ~/shell
nohup /usr/local/eosio/bin/nodeos --config-dir ~/nodeos/config-dir --data-dir ~/nodeos/data-dir --genesis-json ~/nodeos/config-dir/genesis.json > log-nodeos.log 2>&1 &