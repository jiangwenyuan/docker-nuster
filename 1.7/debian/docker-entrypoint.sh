#!/bin/sh
set -e

if [ "${1#-}" != "$1" ]; then
  set -- "haproxy" "$@"
fi

if [ "$1" = 'haproxy' ]; then
  shift
  set -- "haproxy-systemd-wrapper" -p /run/nuster.pid -db "$@"
fi

exec "$@"
