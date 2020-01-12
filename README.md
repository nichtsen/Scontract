# Scontract
> My attempt of deploying smart contract on private ethereum blockchain via [geth APIs](https://github.com/ethereum/go-ethereum/wiki/JavaScript-Console)
## Installation
```
git clone https://github.com/nichtsen/Scontract.git
cd Scontract
chmod +x test.sh
./test.sh
```

## Miner
In your private network, at least one node should be running as the miner.
With `--mine` flag you can start a miner node;
With `admin.addPeer()` method you can connect two nodes;
Finally `admin.peers()` to check the current nodes in your network

## Remix
Compiler for simple contract 
[online](https://remix.ethereum.org/)

## Reference
[Contract tutorial](https://github.com/ethereum/go-ethereum/wiki/Contract-Tutorial)
[Geth docs](https://geth.ethereum.org/docs/)
[Truffle docs](https://www.trufflesuite.com/docs/truffle/overview)
[Web3.js docs](https://web3js.readthedocs.io/en/v1.2.2/)
[Solidity docs](https://solidity.readthedocs.io/en/latest/)
[Remix docs](https://remix-ide.readthedocs.io/en/latest/)
