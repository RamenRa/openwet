#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

#git clone https://github.com/xiaorouji/openwrt-passwall.git -b packages passwall_package
#git clone https://github.com/xiaorouji/openwrt-passwall.git -b luci  package/passwall
#cp -rf passwall_package/*  package/passwall
#rm -rf passwall_package
# echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
# echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"

# git clone https://github.com/wiwizcom/WiFiPortal.git package/WiFiPortal

# 修改内核
set kernel_name=kernel-xxx
echo “” > "$kernel_name"
echo "LINUX_VERSION-5.15 = .140" >> "$kernel_name"
echo "LINUX_KERNEL_HASH-5.15.140 = be2bee8b346f3ccb35879f16c80a323edda571e36190403805c14a9ea24e4a47" >> "$kernel_name"
