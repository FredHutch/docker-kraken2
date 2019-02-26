FROM ubuntu:16.04
MAINTAINER sminot@fredhutch.org

# Install prerequisites
RUN apt update && \
    apt-get install -y build-essential wget unzip python2.7 \
    python-dev git python-pip curl autoconf autogen libssl-dev

# Install kraken2
RUN cd /usr/ && \
    wget http://github.com/DerrickWood/kraken2/archive/v2.0.7-beta.tar.gz && \
    tar xzvf v2.0.7-beta.tar.gz && \
    cd kraken2-2.0.7-beta && \
    ./install_kraken2.sh /usr/local/bin/kraken2 && \
    kraken2-build -h

# Download database
RUN mkdir /database
RUN cd /database/ && \
    wget http://ccb.jhu.edu/software/kraken2/dl/minikraken2_v1_8GB.tgz && \
    gunzip -c minikraken2_v1_8GB.tgz | \
    tar -xvf - && \
    rm minikraken2_v1_8GB.tgz
