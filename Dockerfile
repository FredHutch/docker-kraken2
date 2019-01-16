FROM quay.io/biocontainers/kraken2:2.0.7_beta--pl526h2d50403_0
MAINTAINER sminot@fredhutch.org

# Download database
RUN mkdir /database && \
    cd /database && \
    wget https://ccb.jhu.edu/software/kraken2/dl/minikraken2_v1_8GB.tgz && \
    tar xzvf minikraken2_v1_8GB.tgz && \
    rm minikraken2_v1_8GB.tgz
