FROM debian:10-slim
RUN apt update && \
    apt -y -q install wget libcap2-bin && \
    wget https://github.com/maxmind/geoipupdate/releases/download/v4.3.0/geoipupdate_4.3.0_linux_amd64.deb && \
    apt -y -q install ./geoipupdate_4.3.0_linux_amd64.deb && \
    rm -f ./geoipupdate_4.3.0_linux_amd64.deb &&\
    wget http://apt.ntop.org/buster/all/apt-ntop.deb && \
    apt -y -q install ./apt-ntop.deb && \
    rm -f ./apt-ntop.deb &&\
    apt-get update && \
    apt -y -q install ntopng ntopng-data tzdata && \
    apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    setcap cap_net_raw=pe /usr/bin/ntopng

USER ntopng

EXPOSE 3000

CMD ["ntopng"]
