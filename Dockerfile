FROM ubuntu:22.04
MAINTAINER sminot@fredhutch.org

ARG KRAKEN_VERSION=2.1.2

# Install prerequisites
RUN apt-get update && apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential wget unzip python3 \
    python3-dev git python3-pip curl autoconf autogen libssl-dev \
    ncbi-blast+ rsync grsync

# Install kraken2
RUN cd /usr/ && \
    wget http://github.com/DerrickWood/kraken2/archive/v$KRAKEN_VERSION.tar.gz && \
    tar xzvf v$KRAKEN_VERSION.tar.gz && \
    cd kraken2-$KRAKEN_VERSION && \
    ./install_kraken2.sh /usr/local/bin/kraken2-v$KRAKEN_VERSION && \
    ln -s /usr/local/bin/kraken2-v$KRAKEN_VERSION/kraken2* /usr/local/bin/ && \
    kraken2-build -h
