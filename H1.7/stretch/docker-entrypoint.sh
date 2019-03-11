#!/bin/sh
set -e

if [ "${1#-}" != "$1" ]; then
	set -- haproxy "$@"
fi

if [ "$1" = 'haproxy' ]; then
	shift
	set -- "$(which haproxy-systemd-wrapper)" -p /run/haproxy.pid -db "$@"
fi

exec "$@"
