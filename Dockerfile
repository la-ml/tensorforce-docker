FROM tensorflow/tensorflow:1.4.0-py3

LABEL maintainer="Emmanuel<emmanuelm@gmail.com>"

USER root

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    libfreetype6-dev \
    libpng12-dev \
    libzmq3-dev \
    pkg-config \
    python \
    python-dev \
    rsync \
    software-properties-common \
    cmake \
    swig \
    zlib1g-dev \
    unzip \
    git \
    && \
apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN git clone https://github.com/la-ml/tensorforce.git tensorforce && \
    cd tensorforce && \
    python setup.py install

ENTRYPOINT ["env"]
