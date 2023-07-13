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
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.4/g' ./target/linux/x86/Makefile

# 内核替换成 kernel 5.4.183

sed -i 's/LINUX_KERNEL_HASH-5.4.247 = 33010d4f02314dd4eb51ab5d09f49ce970f2cfefe9f2133a2e085cac5dfffed7/LINUX_KERNEL_HASH-5.4.249 = dc5458462c6edbe3473fc6dee80fbe0841df7c177fe0546c2f131e5918f5351d/g' ./include/kernel-5.4

sed -i 's/LINUX_VERSION-5.4 = .247/LINUX_VERSION-5.4 = .249/g' ./include/kernel-5.4
