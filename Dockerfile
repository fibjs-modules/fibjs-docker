FROM ubuntu:14.04

MAINTAINER ngot "https://github.com/ngot"

RUN apt-get update
RUN apt-get install -y curl g++ make cmake git

ENV FIBJS_VERSION 0.2.1
ENV NODE_VERSION 6.9.2

RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" && \
ls -la && \
tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 && \
rm "node-v$NODE_VERSION-linux-x64.tar.xz" && \
ln -s /usr/local/bin/node /usr/local/bin/nodejs

# Install fibjs
RUN curl -SL "https://github.com/xicilion/fibjs/releases/download/v$FIBJS_VERSION/fibjs-linux" -o fibjs
RUN chmod +x fibjs
RUN sudo mv fibjs /usr/local/bin
