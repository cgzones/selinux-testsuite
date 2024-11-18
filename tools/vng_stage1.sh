#!/bin/sh

set -eux

SCRIPTDIR=$(dirname "$0")

cd /

load_policy -i

setenforce 0

restorecon -RF -T0 /dev

# transition out of initial kernel sid
runcon -u unconfined_u -r unconfined_r -t unconfined_t /bin/bash "${SCRIPTDIR}/vng_stage2.sh"
