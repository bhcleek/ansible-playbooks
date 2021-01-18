#!/usr/bin/env bash

set -eu -o pipefail

trap 'kill $(jobs -p)' TERM EXIT

#rtl_fm -f 144.390M -g 49.6 | direwolf -c /etc/aprs/sdr-igate.conf -r 24000 -D 1 -t 0 &
#rtl_fm -f 144.390M -| direwolf -c /etc/aprs/sdr-igate.conf -r 24000 -D 1 -t 0 &
rtl_fm -f 144.390M -| direwolf -c /etc/aprs/sdr-igate.conf -r 24000 -D 1 -t 0 -dimf &

wait
