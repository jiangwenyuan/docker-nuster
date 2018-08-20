FROM alpine:3.8

ARG NUSTER_VERSION=2.0.2.18
ARG NUSTER_DL_URL=https://github.com/jiangwenyuan/nuster/releases/download/v$NUSTER_VERSION/nuster-$NUSTER_VERSION.tar.gz
ARG NUSTER_DL_FILE=nuster.tar.gz
ARG NUSTER_SRC_DIR=/tmp/nuster

ARG LUA_VERSION=5.3.4
ARG LUA_DL_URL=https://www.lua.org/ftp/lua-$LUA_VERSION.tar.gz
ARG LUA_DL_FILE=lua.tar.gz
ARG LUA_SRC_DIR=/tmp/lua

RUN set -x \
        && apk add --no-cache \
                ca-certificates \
                openssl \
                pcre \
        \
        && apk add --no-cache --virtual .build-deps \
                gcc \
                libc-dev \
                linux-headers \
                make \
                openssl-dev \
                pcre-dev \
                readline-dev \
                tar \
                zlib-dev \
        \
        && mkdir -p $NUSTER_SRC_DIR $LUA_SRC_DIR \
        && wget -O /tmp/$LUA_DL_FILE $LUA_DL_URL \
        && tar -xzf /tmp/$LUA_DL_FILE -C $LUA_SRC_DIR --strip-components=1 \
        && make -C $LUA_SRC_DIR -j "$(getconf _NPROCESSORS_ONLN)" linux \
        && make -C $LUA_SRC_DIR install INSTALL_TOP=$LUA_SRC_DIR \
        \
        && wget -O /tmp/$NUSTER_DL_FILE $NUSTER_DL_URL \
        && tar -xvf /tmp/$NUSTER_DL_FILE -C $NUSTER_SRC_DIR --strip-components=1 \
        \
        && makeOpts=" \
                TARGET=linux2628 \
                USE_LUA=1 \
                LUA_INC=$LUA_SRC_DIR/include \
                LUA_LIB=$LUA_SRC_DIR/lib \
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
        && rm -rf /tmp/nuster* /tmp/lua* \
        && apk del .build-deps

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/etc/nuster/nuster.cfg"]
