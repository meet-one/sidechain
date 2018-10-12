git clone https://github.com/meet-one/eos.git

cd eos

git checkout meetone-sidechain

git submodule update --init --recursive

./eosio_build.sh -s MEETONE

