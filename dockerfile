FROM debian:bookworm-slim

ARG BENNGD_VERSION=r333

# ---------------------------
# Install BennuGD + dependencies
# ---------------------------
WORKDIR /opt/bennugd
RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y \
        libc6:i386 libstdc++6:i386 libx11-6:i386 zlib1g:i386 \
        libsdl1.2-dev:i386 wget curl x11-xserver-utils xvfb xpra xterm && \
    wget https://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.13_i386.deb && \
    dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.13_i386.deb && \
    wget https://www.bennugd.org/downloads/old/bennugd-${BENNGD_VERSION}-i386-linux-gnu.tar.gz && \
    tar xvfz bennugd-${BENNGD_VERSION}-i386-linux-gnu.tar.gz && \
    rm *.tar.gz *.deb

ENV BGDDEV=/opt/bennugd
ENV PATH=$BGDDEV:$PATH
ENV LD_LIBRARY_PATH=$BGDDEV

# ---------------------------
# Copy entrypoint
# ---------------------------
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Add non-root user
RUN useradd -m bennu
USER bennu

# Workdir + Xpra web port
WORKDIR /workdir
EXPOSE 14500

ENTRYPOINT ["/entrypoint.sh"]

# Usage:
# docker build . -t bennugd-compiler:r333
# docker run --rm -ti -v `pwd`/samples/mod_say:/workdir -w /workdir bennugd-compiler:r333 bash -ic 'bgdc main.prg ; bgdi main.dcb'