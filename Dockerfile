FROM ubuntu:17.10

ENV IMAGEBUILDER_URL=http://www.gl-inet.com/lede/ramips/lede-imagebuilder-ramips-mt7628.Linux-x86_64-2.261.tar.xz

WORKDIR /src

RUN apt-get update && apt-get install -y \
  build-essential \
  ccache \
  gawk \
  gettext \
  git \
  libncurses5-dev \
  libssl-dev \
  python \
  subversion \
  unzip \
  wget \
  xsltproc \
  zlib1g-dev

RUN wget -q ${IMAGEBUILDER_URL} -O /tmp/imagebuilder && \
  tar xf /tmp/imagebuilder --strip-components=1 -C /src && \
  rm -f /tmp/imagebuilder
