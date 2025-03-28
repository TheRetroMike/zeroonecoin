FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get install wget build-essential unzip git python2 python2-pip-whl python2-setuptools-whl git virtualenv -y
WORKDIR /opt/
RUN wget https://github.com/zocteam/zeroonecoin/releases/download/v0.13.0/zeroonecore-0.13.0-x86_64-linux-gnu.tar.gz
RUN tar zxvf zeroonecore-0.13.0-x86_64-linux-gnu.tar.gz
RUN mv zeroonecore-0.13.0/bin/zerooned /usr/bin
RUN mv zeroonecore-0.13.0/bin/zeroone-cli /usr/bin
RUN rm -R zeroonecore-0.13.0
RUN rm zeroonecore-0.13.0-x86_64-linux-gnu.tar.gz
RUN wget https://raw.githubusercontent.com/TheRetroMike/rmt-nomp/master/scripts/blocknotify.c
RUN gcc blocknotify.c -o /usr/bin/blocknotify
CMD /usr/bin/zerooned -printtoconsole
