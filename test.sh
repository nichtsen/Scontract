#!/bin/bash

function catch() {
	if [ $err -ne 0 ]; then
		echo "Error:" $err 
		exit 1
	fi
}

function askProceed() {
	read -p "Continue? [Y/n] " ans
	case "$ans" in
	y | Y | "")
	echo "proceeding ..."
	next=1
	;;
	n | N)
	echo "skipping..."
	next=0
	;;
	*)
	echo "invalid response"
	askProceed
	;;
	esac
}

function getEth() {
	wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.9.7-a718daa6.tar.gz
	err=$?
	catch
	tar -C /usr/local -xzf geth*.gz
	echo "export PATH=$PATH:/usr/local/geth-linux-amd64-1.9.7-a718daa6" >> /etc/profile
	export PATH=$PATH:/usr/local/geth-linux-amd64-1.9.7-a718daa6
}


echo "#########################################"
echo "######        set up Eth           ######"
echo "#########################################"
askProceed
if [ $next -eq 1 ]; then
        getEth
fi
geth --datadir "node1" init chains/MyCoin/genesis.json
cp keystore/* node1/keystore

# geth --datadir "node1" export MyCoin.bak
# import pre-build chain
geth --datadir "node1" import chains/MyCoin/MyCoin.bak

# JS console, "exit" to quit  
geth --datadir "node1" --preload "contracts/MyCoin/deploy.js" console 2>> /dev/null

# Issue 16307 
# nohup geth --datadir "node1" --mine --miner.threads=1 --etherbase=0x0000000000000000000000000000000000000000 2>> miner.log &
# nopup geth --datadir "node1" --rpc --rpcaddr "0.0.0.0" -mine --miner.threads=1 --etherbase=0x0000000000000000000000000000000000000000 2>> miner.log &
# geth --preload "builder.js" attach http://
# geth --datadir "node1" --preload "contracts/MyCoin/deploy.js"  attach ipc:/root/Scontract/node1/geth.ipc 2>> /dev/null
