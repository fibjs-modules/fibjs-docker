FROM ubuntu:14.04

MAINTAINER ngot "https://github.com/ngot"

RUN apt-get update
RUN apt-get install -y curl g++ make cmake git 
RUN apt-get install g++-multilib  libc6 libc6-dev binutils -y
RUN rm -f /usr/include/asm
RUN ln -s x86_64-linux-gnu /usr/include/i386-linux-gnu
RUN ln -s x86_64-linux-gnu /usr/include/x86_64-linux-gnux32
RUN rm -f /usr/bin/x86_64-linux-gnu-gcc
RUN rm -f /usr/bin/x86_64-linux-gnu-g++
RUN ln -s gcc-5 /usr/bin/x86_64-linux-gnu-gcc
RUN ln -s g++-5 /usr/bin/x86_64-linux-gnu-g++

RUN git clone https://github.com/fibjs/fibjs.git && \
cd fibjs && \
git submodule init && \
git submodule update && \
sh build -j2 i386 && \
sudo sh bin/Linux_amd64_release/installer.sh  && \
cd ..  && \
rm -rf fibjs