FROM ubuntu:xenial

ARG NUSTER_VERSION=5.2.2.22
ARG NUSTER_DL_URL=https://github.com/jiangwenyuan/nuster/archive/v$NUSTER_VERSION.tar.gz
ARG NUSTER_DL_FILE=nuster.tar.gz
ARG NUSTER_SRC_DIR=/tmp/nuster

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        gcc \
        libc6-dev \
        libpcre3-dev \
        liblua5.3-dev \
        libssl-dev \
        ca-certificates \
        make \
        wget \
        libpcre3 \
        libssl1.0.0 \
        liblua5.3-0 \
        && rm -r /var/lib/apt/lists/* \
        \
        && mkdir -p $NUSTER_SRC_DIR \
        && wget -O /tmp/$NUSTER_DL_FILE $NUSTER_DL_URL \
        && tar -xvf /tmp/$NUSTER_DL_FILE -C $NUSTER_SRC_DIR --strip-components=1 \
        \
        && makeOpts=' \
                TARGET=linux-glibc \
                USE_LUA=1 \
                LUA_INC=/usr/include/lua5.3 \
                USE_OPENSSL=1 \
                USE_PCRE=1 \
                PCREDIR= \
                USE_ZLIB=1 \
        ' \
        && make -C $NUSTER_SRC_DIR -j "$(nproc)" all $makeOpts \
        && make -C $NUSTER_SRC_DIR install-bin $makeOpts \
        \
        && mkdir -p /etc/nuster \
        && cp -R $NUSTER_SRC_DIR/examples/errorfiles /etc/nuster/errors \
        && rm -rf /tmp/nuster* \
        \
        && apt-get purge -y --auto-remove $buildDeps

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nuster", "-f", "/etc/nuster/nuster.cfg"]
