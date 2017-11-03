#!/bin/bash

set -e

: ${USER:=build}
: ${UID:=1000}
: ${GROUP:=build}
: ${GID:=100}

export USER UID GROUP GID

if [ -n "$WORKDIR" ] && [ -d "$WORKDIR" ]; then
    cd "$WORKDIR"
fi

echo "Working as user $USER ($UID)"
groupadd -g "$GID" "$GROUP"
useradd -g "$GROUP" -u "$UID" "$USER"

echo "$USER  ALL = NOPASSWD: ALL" >> /etc/sudoers

exec gosu "$USER" "$@"
