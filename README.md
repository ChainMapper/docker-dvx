# docker-dvx
Wallet and daemon for DVX cryptocurrency on docker

# Quickstart
Type `docker run -it joshendriks/dvx` and see the wallet starting.

```
Docker DVXcoin wallet

By: Jos Hendriks
GitHub: https://github.com/joshendriks/
Docker: https://hub.docker.com/r/joshendriks/

BTC: 1NCZgpMMoNwL6ZeFsEQ2kRZEzzzTd5TuGk
DVX: D8Xc4q3yCoTZ2LWxH5PvSY5w4U2gmqF8Pj

Starting DVX daemon...
```

# Proper start
Use a volume to store all data. The image stores it's data in `/data`. So mapping that volume will do the trick.

Additionally you can override the config and wallet file using volumes pointing to `/config/DVXcoin.conf` and `/config/wallet.data`

# Donations:
BTC: 1NCZgpMMoNwL6ZeFsEQ2kRZEzzzTd5TuGk

DVX: D8Xc4q3yCoTZ2LWxH5PvSY5w4U2gmqF8Pj

# License
MIT, see LICENSE file