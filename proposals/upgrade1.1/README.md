# Overview

The `upgrade1.1` proposal upgrade system contract to meetone-1.1 to enable consensus protocol.

This proposal makes one change to the system:

1. merge eosio.contract 1.7.0 to meetone-1.0.

[Proposal status](https://meetone.eosx.io/tools/msig/proposal?proposer=meetone.m&name=upgrade1.1)

### Review proposal

```
cleos -u https://fullnode.meet.one multisig review meetone.m upgrade1.1
```

### Proposal Status

```
cleos -u https://fullnode.meet.one get table eosio.msig meetone.m approvals2
```

### Approve proposal

```
cleos -u https://fullnode.meet.one multisig approve meetone.m upgrade1.1 '{"actor":"meetone.m","permission":"active"}' -p meetone.m 
```

## [Compare code changes](https://github.com/meet-one/eosio.contracts/compare/v1.7.0...meet-one:meetone-1.1)


# Build system contract

Use [eosio.cdt 1.6.2](https://github.com/EOSIO/eosio.cdt) and [eosio 1.8.x](https://github.com/meet-one/eos) to build eosio.contracts meetone-1.1 smart contract.
```
git clone git@github.com:meet-one/eosio.contracts.git

cd eosio.contracts/

git checkout meetone-1.1

./build.sh
```

## Upgrade eosio.system contracts

Generate the unsigned transaction which upgrade the system contract:

```
cd build/contracts

shasum -a 256 eosio.system/eosio.system.wasm

cleos set contract eosio eosio.system -p eosio -s -j -d > upgrade1.1.json
```

Update `expiration` to a time that sufficiently far in the future to give enough time to collect all the necessary signatures, set `ref_block_num` and `ref_block_prefix` to 0, you will get a transaction like this:

```
{
  "expiration": "2019-08-31T21:00:00",
  "ref_block_num": 0,
  "ref_block_prefix": 0,
  "max_net_usage_words": 0,
  "max_cpu_usage_ms": 0,
  "delay_sec": 0,
  "context_free_actions": [],
  "actions": [{
      "account": "eosio",
      "name": "setcode",
      "authorization": [{
          "actor": "eosio",
          "permission": "active"
        }
      ],
      "data": "......",
    },{
      "account": "eosio",
      "name": "setabi",
      "authorization": [{
          "actor": "eosio",
          "permission": "active"
        }
      ],
      "data": "......"
    }
  ],
  "transaction_extensions": [],
  "signatures": [],
  "context_free_data": []
}
```

### Original system contract on MEET.ONE Mainnet: [eosio.contracts-meetone-1.0](https://github.com/meet-one/eosio.contracts/tree/meetone-1.0)

```
ubuntu 18.04
eosio.cdt 1.5.0
```

eosio.system.wasm hash: 2a3088ffb4d8ddec4b0ecdb5c9bec3e8e5c24b5ad33664e695e0f76311afb03e

### New system contract: [eosio.contracts-meetone-1.1](https://github.com/meet-one/eosio.contracts/tree/meetone-1.1)


```
ubuntu 18.04
eosio.cdt 1.6.2
```

eosio.system.wasm hash: cc5a341e4a66eeb0a5d988174f75ab7b1692079271cc992774fc8bbb0b7e4aa1



## Ricardian Assets

[account.png](https://meet.one/ricardian_assets/eosio.contracts/icons/account.png)
[account.svg](https://meet.one/ricardian_assets/eosio.contracts/icons/account.svg)
[admin.png](https://meet.one/ricardian_assets/eosio.contracts/icons/admin.png)
[admin.svg](https://meet.one/ricardian_assets/eosio.contracts/icons/admin.svg)
[multisig.png](https://meet.one/ricardian_assets/eosio.contracts/icons/multisig.png)
[multisig.svg](https://meet.one/ricardian_assets/eosio.contracts/icons/multisig.svg)
[resource.png](https://meet.one/ricardian_assets/eosio.contracts/icons/resource.png)
[resource.svg](https://meet.one/ricardian_assets/eosio.contracts/icons/resource.svg)
[rex.png](https://meet.one/ricardian_assets/eosio.contracts/icons/rex.png)
[rex.svg](https://meet.one/ricardian_assets/eosio.contracts/icons/rex.svg)
[token.png](https://meet.one/ricardian_assets/eosio.contracts/icons/token.png)
[token.svg](https://meet.one/ricardian_assets/eosio.contracts/icons/token.svg)
[transfer.png](https://meet.one/ricardian_assets/eosio.contracts/icons/transfer.png)
[transfer.svg](https://meet.one/ricardian_assets/eosio.contracts/icons/transfer.svg)
[voting.png](https://meet.one/ricardian_assets/eosio.contracts/icons/voting.png)
[voting.svg](https://meet.one/ricardian_assets/eosio.contracts/icons/voting.svg)
