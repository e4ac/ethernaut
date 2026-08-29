[![CICD](https://github.com/e4ac/ethernaut/actions/workflows/cicd.yml/badge.svg)](https://github.com/e4ac/ethernaut/actions/workflows/cicd.yml)
[![License: GPL v3](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/license/mit)

# Ethernaut Solution
[Ethernaut](https://ethernaut.openzeppelin.com/) solutions implemented in [Solidity](https://www.soliditylang.org/).

## Getting started
Install [Foundry](https://github.com/foundry-rs/foundry) and setup `.env` with content:
```
RPC_URL="https://ethereum-sepolia-rpc.publicnode.com"
PRIVATE_KEY="0xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
```
Update `RPC_URL` and `PRIVATE_KEY` to personal.

## Solve Challenge
```sh
# bash:
export INSTANCE='0xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
forge script script/Challenge.s.sol --rpc-url sepolia --broadcast

# pwsh:
$env:INSTANCE = '0xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
forge script script/Challenge.s.sol --rpc-url sepolia --broadcast
```

## Solve Challenge Locally
```sh
# bash:
export INSTANCE='0xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
forge script script/Challenge.s.sol --rpc-url sepolia

# pwsh:
$env:INSTANCE = '0xAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
forge script script/Challenge.s.sol --rpc-url sepolia
```
