FROM debian:11.2-slim

ENV DEBIAN_FRONTEND=noninteractive

# install general packages
RUN apt update && \
    apt install -y --no-install-recommends \
    gcc \
    g++ \
    libc6-dev \
    libgmp-dev \
    libmpfr-dev \
    make \
    bash-completion && \
    # clean to reduce image size
    apt clean -y && \
    apt autoremove -y && \
    apt autoclean -y && \
    rm -rf /var/lib/apt/lists/*
