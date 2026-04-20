#!/bin/bash
set -euo pipefail

cd openwrt;

./scripts/feeds update -a && ./scripts/feeds install -a

curl -sL -o .config https://downloads.openwrt.org/snapshots/targets/mediatek/filogic/config.buildinfo

sed -i 's/^CONFIG_TARGET_ALL_PROFILES=y/# CONFIG_TARGET_ALL_PROFILES is not set/' .config
sed -i 's/^CONFIG_TARGET_MULTI_PROFILE=y/# CONFIG_TARGET_MULTI_PROFILE is not set/' .config
sed -i 's/^CONFIG_TARGET_DEVICE_mediatek_filogic_DEVICE_.*=y/# &/' .config
sed -i 's/^# \(CONFIG_TARGET_DEVICE_mediatek_filogic_DEVICE_bananapi_bpi-r4=y\)/\1/' .config
sed -i 's/^# \(CONFIG_TARGET_DEVICE_PACKAGES_mediatek_filogic_DEVICE_bananapi_bpi-r4=".*"\)/\1/' .config

make -j $(nproc) defconfig download clean world
