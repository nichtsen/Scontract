#!/bin/bash

geth --datadir "node1" init chains/MyCoin/genesis.json
cp keystore/* node1/keystore/

# geth --datadir "node1" export MyCoin.bak
# import pre-build chain
geth --datadir "node1" import chains/MyCoin/MyCoin.bak

# JS console, "exit" to quit  
geth --datadir "node1" --nodiscover console 2>>geth.log