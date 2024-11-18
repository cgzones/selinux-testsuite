#!/bin/sh

set -eux

SCRIPTDIR=$(dirname "$0")

cd /

setenforce 1

# display some system status information
dmesg | tail -n 40
id
sestatus

cd "${SCRIPTDIR}/../"

make test -j"$(nproc)" || true

/bin/bash -i
