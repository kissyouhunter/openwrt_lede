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

# 替换index.htm文件 X86
wget -O ./package/lean/autocore/files/x86/index.htm https://raw.githubusercontent.com/kissyouhunter/openwrt_lede/main/diy/x86_lede/index_x86.htm

# 替换banner
wget -O ./package/base-files/files/etc/banner https://raw.githubusercontent.com/kissyouhunter/openwrt_lede/main/diy/x86_lede/banner

# 替换内核
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.10/g' ./target/linux/x86/Makefile

# 内核替换成 kernel 5.10.90

sed -i 's/LINUX_KERNEL_HASH-5.10.187 = f69454210b3e9e00e8b8368aaa897d4ca59f8be3b85399a2fcaecbf17af98bbb/LINUX_KERNEL_HASH-5.10.189 = 4c03516ae1d417571faaef175932d0892710bcbe0173e40550014d043d9098c9/g' ./include/kernel-5.10

sed -i 's/LINUX_VERSION-5.10 = .187/LINUX_VERSION-5.10 = .189/g' ./include/kernel-5.10

