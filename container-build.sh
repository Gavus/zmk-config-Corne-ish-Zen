#!/usr/bin/env bash

if test -f "$(which podman)"; then
    cont_mgr="podman"
elif test -f "(which docker)"; then
    cont_mgr="docker"
else
    echo "No container manager found. Please install docker or podman."
    exit 1
fi

${cont_mgr} run -it --rm -v $PWD:$PWD:z -w $PWD docker.io/zmkfirmware/zmk-build-arm:2.5 ./build.sh
