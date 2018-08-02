FROM chainmapper/walletbase-xenial-build as builder
#RUN apt-get update \
#    && apt-get -y upgrade \
#	&& apt-get -y install libminiupnpc-dev libminiupnpc-dev

ENV GIT_COIN_URL    https://github.com/dvx-dev/dvx-coin.git
ENV GIT_COIN_NAME   dvx   

RUN git clone $GIT_COIN_URL $GIT_COIN_NAME \
	&& cd $GIT_COIN_NAME \
	&& git checkout tags/v1.0.5.1 \
	&& chmod +x share/genbuild.sh \
	&& chmod +x src/leveldb/build_detect_platform \
	&& cd src \
	&& make -f	makefile.unix "USE_UPNP=-"\
	&& cp DVXcoind /usr/local/bin \
	&& cd / && rm -rf /$GIT_COIN_NAME \
	&& mkdir /data \
	&& mkdir /data/.DVXcoin
	
FROM chainmapper/walletbase-xenial as runtime

COPY --from=builder /usr/local/bin /usr/local/bin

RUN mkdir /data
ENV HOME /data

#rpc port & main port
EXPOSE 17058 17057

COPY start.sh /start.sh
COPY gen_config.sh /gen_config.sh
RUN chmod 777 /*.sh
CMD /start.sh DVXcoin.conf DVX DVXcoind