# Verifiable Logistic Regression in Cairo, deployed on Katana


Deployment steps 🚀

``` 
scarb build
```

```
mkdir -p ~/.starkli-wallets/deployer/
export STARKNET_KEYSTORE="~/.starkli-wallets/deployer/account0_keystore.json"
export STARKNET_ACCOUNT="~/.starkli-wallets/deployer/account0_account.json"
export STARKNET_RPC="http://0.0.0.0:5050/"
```

```
katana --accounts 3 --seed 0 --disable-fee
```

starkli signer keystore from-key ~/.starkli-wallets/deployer/account0_keystore.json
# supply private key (see katana terminal)

touch ~/.starkli-wallets/deployer/account0_account.json

starkli class-hash-at 0x1d98d835e43b032254ffbef0f150c5606fa9c5c9310b1fae370ab956a7919f5 --rpc http://0.0.0.0:5050

# declare
starkli declare target/dev/logistic_regression_main.sierra.json --rpc http://0.0.0.0:5050 --account ~/.
starkli-wallets/deployer/account0_account.json --keystore ~/.starkli-wallets/deployer/account0_keystore.json

# class hash 0x02d4f014e63ecfe53a34329803de3a15afb73189065ca4b383a08b539a62424b

starkli deploy 0x02d4f014e63ecfe53a34329803de3a15afb73189065ca4b383a08b539a62424b 1125 --rpc http://0.0.0.0:5050 --account ~/.starkli-wallets/deployer/account0_account.json --keystore ~/.starkli-wallets/deployer/account0_keystore.json


# deployed at 0x0102ca73007109395b37303c5191f5380d5abf13e3f027390d25f765788d8477

# invoke main function on Katana
starkli invoke 0x0102ca73007109395b37303c5191f5380d5abf13e3f027390d25f765788d8477 main
