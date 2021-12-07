#!/usr/bin/env bash

podman run -it --rm -v $PWD:$PWD:z -w $PWD docker.io/zmkfirmware/zmk-build-arm:2.5 ./build.sh
