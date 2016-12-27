FROM ubuntu:14.04

MAINTAINER ngot "https://github.com/ngot"

RUN apt-get update
RUN apt-get install -y curl g++ make cmake git

RUN git clone https://github.com/xicilion/fibjs.git && \
cd fibjs && \
git submodule init && \
git submodule update && \
sh build -j && \
sudo sh bin/Linux_amd64_release/installer.sh
