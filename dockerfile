FROM debian:bookworm-slim

ARG BENNGD_VERSION=r333

WORKDIR /opt/bennugd

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y --no-install-recommends \
        libc6:i386 libstdc++6:i386 libx11-6:i386 zlib1g:i386 \
        libsdl1.2debian:i386 libsdl-image1.2:i386 libsdl-mixer1.2:i386 wget ca-certificates nano && \
    \
    wget https://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.13_i386.deb && \
    dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.13_i386.deb && \
    \
    wget https://www.bennugd.org/downloads/old/bennugd-${BENNGD_VERSION}-i386-linux-gnu.tar.gz && \
    tar xvf bennugd-${BENNGD_VERSION}-i386-linux-gnu.tar.gz && \
    rm -f *.tar.gz *.deb && \
    \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ENV BGDDEV=/opt/bennugd
ENV PATH=$BGDDEV:$PATH
ENV LD_LIBRARY_PATH=$BGDDEV

WORKDIR /workdir

# usage:
# docker build . -t bennugd-compiler:r333

## console
# docker run --rm -ti -v `pwd`/samples/mod_say:/workdir -w /workdir bennugd-compiler:r333 bash -ic 'bgdc main.prg ; bgdi main.dcb'

## graphic
# xhost +
# docker run --rm -ti -v `pwd`/samples/mod_text:/workdir -w /workdir -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix bennugd-compiler:r333 bash -ic 'bgdc main.prg ; bgdi main.dcb'

