FROM ubuntu:14.04

MAINTAINER ngot "https://github.com/ngot"

RUN apt-get update
RUN apt-get install -y curl g++ make cmake git xz-utils

ENV NODE_VERSION 6.9.2

# install Node.js
RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz"
RUN tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1
RUN rm -f "node-v$NODE_VERSION-linux-x64.tar.xz"
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs

# install fibjs
RUN git clone https://github.com/fibjs/fibjs.git && \
cd fibjs && \
git submodule init && \
git submodule update && \
sh build -j && \
sudo sh bin/Linux_amd64_release/installer.sh  && \
cd ..  && \
rm -rf fibjs
