#!/bin/sh

set -e

rsync -av "$(dirname "$0")" /usr/local/m/versions --exclude install.sh
