FROM ubuntu:20.04

RUN apt update &&\
    apt-get install wget -y &&\
    wget https://www.perforce.com/downloads/perforce/r22.1/bin.linux26x86_64/helix-core-server.tgz -O /tmp/p4client.tgz &&\
    mkdir -p /usr/bin/p4 &&\
    tar zxvf /tmp/p4client.tgz -C /usr/bin/p4 &&\
    rm /tmp/p4client.tgz &&\
    chmod +x /usr/bin/p4/p4 &&\
    chmod +x /usr/bin/p4/p4broker &&\
    chmod +x /usr/bin/p4/p4d &&\
    chmod +x /usr/bin/p4/p4p 

ENV PATH="${PATH}:/usr/bin/p4"