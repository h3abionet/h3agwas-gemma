FROM ubuntu:latest

MAINTAINER Eugene de Beste

ENV ver "0.94.1"
ENV url "http://www.xzlab.org/software/gemma-${ver}/gemma"

#RUN groupadd -r emmax && useradd -r -g emmax emmax

# Install the packages needed to download and extract plink
RUN apt-get update && apt-get install -y \
    wget \
    unzip

# Download and extract binary to /usr/bin

RUN wget $url

RUN chmod +x gemma

RUN mv gemma /usr/bin/.

RUN wget https://www.cog-genomics.org/static/bin/plink170521/plink_linux_x86_64.zip && \
    unzip plink_linux_x86_64.zip -d /usr/bin/

RUN rm -rf plink_linux_x86_64.zip
