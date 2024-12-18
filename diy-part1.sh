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

# 使用sed命令替换的方式换源
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
# 修复 hostapd 报错
# cp -f $GITHUB_WORKSPACE/scripts/011-fix-mbo-modules-build.patch package/network/services/hostapd/patches/011-fix-mbo-modules-build.patch
cp -f $GITHUB_WORKSPACE/script/011-fix-mbo-modules-build.patch package/network/services/hostapd/patches/011-fix-mbo-modules-build.patch

# 修复 armv8 设备 xfsprogs 报错
sed -i 's/TARGET_CFLAGS.*/TARGET_CFLAGS += -DHAVE_MAP_SYNC -D_LARGEFILE64_SOURCE/g' feeds/packages/utils/xfsprogs/Makefile

# ./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns
# rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
# rm -rf feeds/packages/utils/v2dat
# rm -rf feeds/packages/lang/golang
# git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
# ./scripts/feeds install -a


# Add a feed source
# 单个包的源码
# git clone https://github.com/wiwizcom/WiFiPortal.git package/WiFiPortal  # 直接拉取到package/WiFiPortal

# git clone https://github.com/xiaorouji/openwrt-passwall-packages.git -b main passwall_package  # passwall源码分成了两个仓库
# git clone https://github.com/xiaorouji/openwrt-passwall.git -b main  package/passwall
# cp -rf passwall_package/*  package/passwall
# rm -rf passwall_package

# echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
# echo "src-git passwall src-git https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
# git clone  https://github.com/gdy666/luci-app-lucky.git package/lucky  # luck万吉
# 整个源
# echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
# echo "src-git immluci https://github.com/openwrt/luci.git" >> "feeds.conf.default"


# 修改内核小版本 (已作废以下)
# linux_version="5.15" # 不建议随意修改，具体查看源码的内核版本
# file_path="include/kernel-$linux_version"  # 请替换为实际的文件路径
# linux_patch=".140"  # 内核小版本
# kernel_hash_value="be2bee8b346f3ccb35879f16c80a323edda571e36190403805c14a9ea24e4a47"  # 
# # 清空文件内容
# > "$file_path"
# # 写入新内容，使用变量动态生成内容
# echo "LINUX_VERSION-$linux_version = $linux_patch" >> "$file_path"
# echo "LINUX_KERNEL_HASH-$linux_version$linux_patch = $kernel_hash_value" >> "$file_path"

