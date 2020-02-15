# Start from the latest golang base image
FROM golang:1.13.4-alpine3.10

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh
WORKDIR /famjam

RUN apk add --no-cache autoconf automake libtool gettext gettext-dev make g++ texinfo curl
# fswatch is not available at alpine packages
WORKDIR /root
RUN wget https://github.com/emcrisostomo/fswatch/releases/download/1.14.0/fswatch-1.14.0.tar.gz
RUN tar -xvzf fswatch-1.14.0.tar.gz
WORKDIR /root/fswatch-1.14.0
RUN ./configure
RUN make 
RUN make install 
WORKDIR /famjam