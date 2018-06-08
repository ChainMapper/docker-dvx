FROM joshendriks/walletbase

RUN apt-get update \
    && apt-get -y upgrade \
	&& apt-get -y install libminiupnpc-dev libminiupnpc-dev

ENV GIT_COIN_URL    https://github.com/dvx-dev/dvx-coin.git
ENV GIT_COIN_NAME   dvx   

RUN	git clone $GIT_COIN_URL $GIT_COIN_NAME \
	&& cd $GIT_COIN_NAME \
	&& chmod +x share/genbuild.sh \
	&& chmod +x src/leveldb/build_detect_platform \
	&& cd src \
	&& make -f	makefile.unix RELEASE=1\
	&& cp DVXcoind /usr/local/bin \
	&& cd / && rm -rf /$GIT_COIN_NAME \
	&& mkdir /data \
	&& mkdir /data/.DVXcoin
	
#Add a config so you can run without providing a bitnodes.conf through a volume
COPY DVXcoin.conf /data/.DVXcoin/DVXcoin.conf

#rpc and mn port
EXPOSE 17058 17057

ENV HOME /data

COPY start.sh /start.sh
RUN chmod 777 /start.sh
CMD /start.sh