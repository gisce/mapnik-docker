FROM ubuntu:16.04

# Prerequisites and runtimes

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    build-essential sudo software-properties-common curl \
    libboost-dev libboost-filesystem-dev libboost-program-options-dev \
    libboost-python-dev libboost-regex-dev libboost-system-dev libboost-thread-dev \
    libicu-dev libtiff5-dev libfreetype6-dev libpng12-dev libxml2-dev libproj-dev \
    libsqlite3-dev libgdal-dev libcairo-dev python-cairo-dev postgresql-contrib libharfbuzz-dev \
    nodejs python3-dev python-dev git python-pip python-setuptools python-wheel python3-setuptools python3-pip python3-wheel \
    && rm -rf /var/lib/apt/lists/*

RUN cd /usr/local/src && git clone https://github.com/mapnik/mapnik.git --depth 10 -b v3.0.x mapnik-3.0.x && cd mapnik-3.0.x
RUN cd /usr/local/src/mapnik-3.0.x && git submodule update --init

RUN cd /usr/local/src/mapnik-3.0.x && ./configure
RUN cd /usr/local/src/mapnik-3.0.x && make && make install