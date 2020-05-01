FROM debian:10-slim

COPY ./root /

RUN apt update && \
    apt -y -q install wget libcap2-bin && \
    wget http://apt.ntop.org/buster/all/apt-ntop.deb && \
    apt -y -q install ./apt-ntop.deb && \
    rm -f ./apt-ntop.deb &&\
    apt-get update && \
    apt -y -q install ntopng ntopng-data tzdata && \
    apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    setcap cap_net_raw=pe /usr/bin/ntopng && \
    chmod +x /entrypoint.sh

# USER ntopng - ntop will auto switch, need root for geoipupdate

EXPOSE 3000


CMD ["/entrypoint.sh"]
