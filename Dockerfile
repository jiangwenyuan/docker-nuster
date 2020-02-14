FROM debian:stretch-slim

ARG NUSTER_SRC_GIT=https://github.com/jiangwenyuan/nuster.git
ARG NUSTER_SRC_DIR=/tmp/nuster

ADD https://api.github.com/repos/jiangwenyuan/nuster/git/refs/heads/master tmp.json

RUN set -x \
        && buildDeps=' \
                gcc \
                libc6-dev \
                liblua5.3-dev \
                libpcre3-dev \
                libssl-dev \
		zlib1g-dev \
        ' \
        && tools=' \
                ca-certificates \
                make \
                git \
        ' \
        && runtimes=' \
                libpcre3 \
                libssl1.1 \
                liblua5.3-0 \
        ' \
        && apt-get update \
        && apt-get install -y --no-install-recommends $buildDeps $tools $runtimes \
        && rm -r /var/lib/apt/lists/* \
        \
        && git clone --depth 1 $NUSTER_SRC_GIT $NUSTER_SRC_DIR \
        && ls $NUSTER_SRC_DIR \
        \
        && makeOpts=' \
                TARGET=linux2628 \
                USE_LUA=1 \
                LUA_INC=/usr/include/lua5.3 \
                USE_OPENSSL=1 \
                USE_PCRE=1 \
                PCREDIR= \
                USE_ZLIB=1 \
                IGNOREGIT=1 \
        ' \
        && make -C $NUSTER_SRC_DIR -j "$(nproc)" all $makeOpts \
        && make -C $NUSTER_SRC_DIR install-bin $makeOpts \
        \
        && mkdir -p /etc/nuster \
        && cp -R $NUSTER_SRC_DIR/examples/errorfiles /etc/nuster/errors \
        && rm -rf /tmp/nuster* \
        \
        && apt-get purge -y --auto-remove $buildDeps && rm tmp.json

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nuster", "-f", "/etc/nuster/nuster.cfg"]
