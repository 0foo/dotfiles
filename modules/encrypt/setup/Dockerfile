FROM debian:latest
RUN apt-get update
RUN apt-get install -y openssh-server iproute2 iputils-ping nano

COPY ./functions.sh /root
RUN mkdir /data
WORKDIR /data

