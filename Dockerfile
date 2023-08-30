

# install scarb 📦️
curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh 
    
# docker exec -it <container-name> bash

# install katana 
mkdir ~/.dojo 
cd ~/.dojo

apt-get update && apt-get install -y wget
wget -P /tmp https://github.com/dojoengine/dojo/archive/refs/tags/v0.2.1.tar.gz && tar -xvf /tmp/v0.2.1.tar.gz -C /tmp
cd /tmp/dojo-0.2.1

# install rust 🦀
# Install Rust and Cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Source the shell profile
# Add Rust's cargo binary path to PATH
ENV PATH="~/.cargo/bin:$PATH"

# Source the shell profile

/bin/sh -c "cargo --version"

#
# /bin/sh -c "/$HOME/.cargo/bin/cargo --version"


cargo install --path ./crates/katana --locked --force

# # install starkli 🔨
curl https://get.starkli.sh | sh
# # source ~/.bashrc 
/bin/sh -c starkliup

# # generate new keystore 🔑
# mkdir -p ~/.starkli-wallets/deployer/
# export STARKNET_KEYSTORE="~/.starkli-wallets/deployer/account0_keystore.json"
# 

mkdir -p ~/.starkli-wallets/deployer/
export STARKNET_KEYSTORE="~/.starkli-wallets/deployer/account0_keystore.json"
export STARKNET_ACCOUNT="~/.starkli-wallets/deployer/account0_account.json"
export STARKNET_RPC="http://0.0.0.0:5050/"


katana --accounts 3 --seed 0 --disable-fee


starkli signer keystore from-key ~/.starkli-wallets/deployer/account0_keystore.json
# supply private key (see katana terminal)

touch ~/.starkli-wallets/deployer/account0_account.json

starkli class-hash-at 0x1d98d835e43b032254ffbef0f150c5606fa9c5c9310b1fae370ab956a7919f5 --rpc http://0.0.0.0:5050

# declare
starkli declare target/dev/logistic_regression_main.sierra.json --rpc http://0.0.0.0:5050 --account ~/.starkli-wallets/deployer/account0_account.json --keystore ~/.starkli-wallets/deployer/account0_keystore.json



# class hash
0x02d4f014e63ecfe53a34329803de3a15afb73189065ca4b383a08b539a62424b


starkli deploy 0x02d4f014e63ecfe53a34329803de3a15afb73189065ca4b383a08b539a62424b 1125 --rpc http://0.0.0.0:5050 --account ~/.starkli-wallets/deployer/account0_account.json --keystore ~/.starkli-wallets/deployer/account0_keystore.json


# deployed at 0x0102ca73007109395b37303c5191f5380d5abf13e3f027390d25f765788d8477

starkli invoke 0x0102ca73007109395b37303c5191f5380d5abf13e3f027390d25f765788d8477 main
