#!/bin/bash -e

if [ ! -d "zmk" ]; then
    west init -l config
    west update
    west zephyr-export
fi

mkdir -p build/left build/right
west build -d build/left  -s zmk/app -b corne-ish_zen_left  -- -DZMK_CONFIG="${PWD}/config"
west build -d build/right -s zmk/app -b corne-ish_zen_right -- -DZMK_CONFIG="${PWD}/config"
cp build/left/zephyr/zmk.uf2 corneish_zen_left.uf2
cp build/right/zephyr/zmk.uf2 corneish_zen_right.uf2
