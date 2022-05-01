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
sed -i 's/PATCHVER:=5.15/PATCHVER:=5.10/g' ./target/linux/x86/Makefile

# 内核替换成 kernel 5.10.90

#sed -i 's/LINUX_KERNEL_HASH-5.10.100 = d56965afc9b6a3d26d53db40ccd37fd9d15f2ca6bfd54ef6f0f8b6e92c170999/LINUX_KERNEL_HASH-5.10.101 = 0749258cb7ee47c478dfc34857e8930d41bfe0b074e80e9f57cbfa56d0ba1c8e/g' ./include/kernel-5.10

#sed -i 's/LINUX_VERSION-5.10 = .100/LINUX_VERSION-5.10 = .101/g' ./include/kernel-5.10

