#!/bin/sh
set -e

if [ "${1#-}" != "$1" ]; then
  set -- "nuster" "$@"
fi

if [ "$1" = 'nuster' ]; then
  shift
  set -- nuster -W -db "$@"
fi

exec "$@"
