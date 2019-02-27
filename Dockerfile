FROM ubuntu:16.04
MAINTAINER sminot@fredhutch.org

# Install prerequisites
RUN apt update && \
    apt-get install -y build-essential wget unzip python2.7 \
    python-dev git python-pip curl autoconf autogen libssl-dev \
    ncbi-blast+

# Install kraken2
RUN cd /usr/ && \
    wget http://github.com/DerrickWood/kraken2/archive/v2.0.7-beta.tar.gz && \
    tar xzvf v2.0.7-beta.tar.gz && \
    cd kraken2-2.0.7-beta && \
    ./install_kraken2.sh /usr/local/bin/kraken2-v2.0.7 && \
    ln -s /usr/local/bin/kraken2-v2.0.7/kraken2* /usr/local/bin/ && \
    kraken2-build -h
