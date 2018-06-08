#!/bin/bash
echo "Docker DVX wallet

By: Jos Hendriks
GitHub: https://github.com/joshendriks/
Docker: https://hub.docker.com/r/joshendriks/ 

BTC: 1NCZgpMMoNwL6ZeFsEQ2kRZEzzzTd5TuGk
DVX: D8Xc4q3yCoTZ2LWxH5PvSY5w4U2gmqF8Pj"

config="/config/DVXcoin.conf"
if [ -f "$config" ]
then
    echo "Using $config"
    cp $config /data/.DVXcoin/DVXcoin.conf
fi

wallet="/config/wallet.dat"
if [ -f "$wallet" ]
then
    echo "Using $wallet"
    cp $wallet /data/.DVXcoin/wallet.dat
fi

echo "Starting DVX daemon..."
DVXcoind
