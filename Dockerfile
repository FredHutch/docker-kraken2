FROM ubuntu:20.04
MAINTAINER sminot@fredhutch.org

# Install prerequisites
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential wget unzip python3 \
    python3-dev git python3-pip curl autoconf autogen libssl-dev \
    ncbi-blast+ rsync grsync

# Install kraken2
RUN cd /usr/ && \
    wget http://github.com/DerrickWood/kraken2/archive/v2.0.9-beta.tar.gz && \
    tar xzvf v2.0.9-beta.tar.gz && \
    cd kraken2-2.0.9-beta && \
    ./install_kraken2.sh /usr/local/bin/kraken2-v2.0.9 && \
    ln -s /usr/local/bin/kraken2-v2.0.9/kraken2* /usr/local/bin/ && \
    kraken2-build -h
