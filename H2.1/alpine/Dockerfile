FROM alpine:3.11

ARG NUSTER_VERSION=5.0.11.21
ARG NUSTER_DL_URL=https://github.com/jiangwenyuan/nuster/archive/v$NUSTER_VERSION.tar.gz
ARG NUSTER_DL_FILE=nuster.tar.gz
ARG NUSTER_SRC_DIR=/tmp/nuster

RUN set -x \
        && apk add --no-cache --virtual .build-deps \
                ca-certificates \
                gcc \
                libc-dev \
                linux-headers \
                lua5.3-dev \
                make \
                openssl \
                openssl-dev \
                pcre-dev \
                readline-dev \
                tar \
                zlib-dev \
        \
        && apk add --no-cache pcre lua5.3 \
        && mkdir -p $NUSTER_SRC_DIR \
        \
        && wget -O /tmp/$NUSTER_DL_FILE $NUSTER_DL_URL \
        && tar -xvf /tmp/$NUSTER_DL_FILE -C $NUSTER_SRC_DIR --strip-components=1 \
        \
        && makeOpts=" \
                TARGET=linux-glibc \
                USE_LUA=1 \
                LUA_INC=/usr/include/lua5.3 \
                LUA_LIB=/usr/lib/lua5.3 \
                USE_OPENSSL=1 \
                USE_PCRE=1 \
                PCREDIR= \
                USE_ZLIB=1 \
        " \
        && make -C $NUSTER_SRC_DIR -j "$(getconf _NPROCESSORS_ONLN)" all $makeOpts \
        && make -C $NUSTER_SRC_DIR install-bin $makeOpts \
        \
        && mkdir -p /etc/nuster \
        && cp -R $NUSTER_SRC_DIR/examples/errorfiles /etc/nuster/errors \
        \
        && rm -rf /tmp/nuster* \
        && apk del .build-deps

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nuster", "-f", "/etc/nuster/nuster.cfg"]
