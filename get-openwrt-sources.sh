#!/bin/bash
rm -rf openwrt

git config --global user.email "example@example.org"
git config --global user.name "example"

git clone https://github.com/openwrt/openwrt.git
