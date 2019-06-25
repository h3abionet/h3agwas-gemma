FROM ubuntu:latest

MAINTAINER Scott Hazelhurst

#thanks Eugene de Beste

ENV ver "0.98.1"
ENV url "https://github.com/genetics-statistics/GEMMA/releases/download/0.98.1/gemma-0.98.1-linux-static.gz"
ENV plinksrc "plink_linux_x86_64_20190617.zip"

#RUN groupadd -r emmax && useradd -r -g emmax emmax

# Install the packages needed to download and extract plink
RUN apt-get update && apt-get install -y \
    wget unzip python3\
    gzip

# Download and extract binary to /usr/bin

RUN wget $url && gunzip gemma-0.98.1-linux-static.gz && mv gemma-0.98.1-linux-static /usr/bin/gemma &&  chmod +x /usr/bin/gemma

RUN wget http://s3.amazonaws.com/plink1-assets/$plinksrc && \
    unzip $plinksrc -d /usr/bin/

RUN rm -rf $plinksrc
