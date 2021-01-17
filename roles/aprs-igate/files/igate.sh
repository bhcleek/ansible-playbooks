#!/usr/bin/env bash

set -eu -o pipefail

rtl_fm -f 144.390M | direwolf -c /etc/aprs/sdr-igate.conf -r 24000 -D 1 -t 0
