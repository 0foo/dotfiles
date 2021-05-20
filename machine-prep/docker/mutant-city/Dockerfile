FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y git-all

COPY ./functions.sh /root
RUN mkdir /data
WORKDIR /data

