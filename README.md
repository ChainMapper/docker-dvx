# docker-dvx
Wallet and daemon for DVX cryptocurrency on docker

# Quickstart
Type `docker run -it -e "USER=me" -e "PASSWORD=secret" -e "RPCALLOW=127.0.0.1" chainmapper/dvx` and see the wallet starting.

Alternatively type `docker run -it -v "<path_to_config>:/config/PayCon.conf" chainmapper/dvx` to use your own config.

```
Docker DVX wallet

By: ChainMapper
Website: https://chainmapper.com

Starting DVX daemon...
```

# Proper start
Use a volume to store all data. The image stores it's data in `/data`. So mapping that volume will do the trick.

Additionally you can override the config and wallet file using volumes pointing to `/config/DVXcoin.conf` and `/config/wallet.data`

# License
MIT, see LICENSE file