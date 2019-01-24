# 1. Install

cd ~
git clone https://github.com/meet-one/eos.git
cd eos
git checkout tags/v1.6.0
git submodule update --init --recursive
./eosio_build.sh -s MEETONE
cd build
sudo make install
echo 'PATH=$PATH:/usr/local/eosio/bin/' >> ~/.profile
source ~/.profile
