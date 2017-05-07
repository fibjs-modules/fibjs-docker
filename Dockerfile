FROM ubuntu:14.04

MAINTAINER ngot "https://github.com/ngot"

RUN apt-get update
RUN apt-get install -y curl g++ make cmake git 
RUN apt-get install g++-multilib  libc6 libc6-dev binutils -y
RUN rm -f /usr/include/asm
RUN ln -s x86_64-linux-gnu /usr/include/i386-linux-gnu
RUN ln -s x86_64-linux-gnu /usr/include/x86_64-linux-gnux32

RUN apt-get install g++-arm-linux-gnueabihf -y
RUN apt-get install g++-aarch64-linux-gnu -y
RUN apt-get install g++-mips-linux-gnu -y
RUN apt-get install g++-mips64-linux-gnuabi64 -y
RUN apt-get install g++-powerpc-linux-gnu -y
RUN apt-get install g++-powerpc64-linux-gnu -y
