#!/bin/sh

set -e

if test "`id -u`" != 0; then
  if which sudo 2>/dev/null 1>&2; then
    echo "This needs to be run as root, trying sudo" 1>&2
    exec sudo sh -x "$0" "$@"
  else
    echo "This needs to be run as root" 1>&2
    exit 2
  fi
fi

mkdir -p /usr/local/m/versions

rsync -av "$(dirname "$0")"/ /usr/local/m/versions --exclude install.sh
