#!/bin/bash

: ${DIST:=}
: ${BUILDRESULT:="$PWD/result"}

CMD=`basename "$0"`

docker run -it --rm \
    -e WORKDIR="$PWD" \
    -e UID=`id -u` \
    -e GID=`id -g` \
    -e DIST="$DIST" \
    -e BUILDRESULT="$BUILDRESULT" \
    -v "$HOME":"$HOME" \
    -v /data/cache/cowbuilder:/var/cache/pbuilder \
    --privileged \
    lazyfrosch/cowbuilder "$CMD" "$@"
