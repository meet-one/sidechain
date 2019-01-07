### full node

nodeos --data-dir ./nodeos/full-node/data-dir --config-dir ./nodeos/full-node/config-dir

# first launch
# nodeos --data-dir ./nodeos/full-node/data-dir --config-dir ./nodeos/full-node/config-dir --genesis-json ./nodeos/full-node/config-dir/genesis.json



### peer node

nodeos --data-dir ./nodeos/peer-node/data-dir --config-dir ./nodeos/peer-node/config-dir

# nodeos --data-dir ./nodeos/peer-node/data-dir --config-dir ./nodeos/peer-node/config-dir --genesis-json ./nodeos/peer-node/config-dir/genesis.json


### producer node

nodeos --data-dir ./nodeos/producer-node/data-dir --config-dir ./nodeos/producer-node/config-dir

# nodeos --data-dir ./nodeos/producer-node/data-dir --config-dir ./nodeos/producer-node/config-dir --genesis-json ./nodeos/producer-node/config-dir/genesis.json