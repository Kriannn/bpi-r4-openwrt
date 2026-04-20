#!/bin/bash
set -euo pipefail

cd openwrt;

./scripts/feeds update -a && ./scripts/feeds install -a

cp ../configs/bpi-r4.config .config

make -j $(nproc) defconfig download clean world
