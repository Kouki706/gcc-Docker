FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# install general packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    gcc \
    g++ \
    libgmp-dev \
    libmpfr-dev \
    make \
    python3 \
    python3-pip \
    bash-completion \
    gnuplot && \
    # Install Fonts
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && \
    apt-get install -y --no-install-recommends ttf-mscorefonts-installer \
    fonts-ipafont fonts-ipaexfont \
    fontconfig && \
    fc-cache -fv && \
    # clean to reduce image size
    apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/*

# Install scpy
RUN pip install --upgrade pip && \
    pip install scipy matplotlib numpy pandas jupyter
