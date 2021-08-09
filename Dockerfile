FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# install general packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3.9 \
    python3-pip \
    gcc-10 \
    libc6-dev \
    libc-dev \
    libgmp3-dev \
    make && \
    # clean to reduce image size
    apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/*

# Change symbolic links
RUN ln -s /usr/bin/python3.9 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
    ln -s /usr/bin/gcc-10 /usr/bin/gcc

# Install scpy
RUN pip install --upgrade pip && \
    pip install scipy matplotlib numpy pandas jupyter
