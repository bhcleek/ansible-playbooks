#!/bin/bash

FILEPATH=$1
OLDFILE="$2"
OLDHEX="$3"
OLDMODE="$4"
NEWFILE="$5"
NEWHEX="$6"
NEWMODE="$7"

diff <(ansible-vault view "$OLDFILE") <(ansible-vault view "$NEWFILE")
exit 0
