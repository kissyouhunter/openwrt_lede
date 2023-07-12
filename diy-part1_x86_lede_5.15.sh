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
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.15/g' ./target/linux/x86/Makefile

# 内核替换成 kernel 5.15.14

#sed -i 's/LINUX_KERNEL_HASH-5.15.23 = e839c6fe4db9327178ecccc7fb14035000496bb8028a32735213675eefa97a1c/LINUX_KERNEL_HASH-5.15.24 = f496eb03c88731540d483837f919c083148875a7b400468237f0217b5e5ca97f/g' ./include/kernel-5.15

#sed -i 's/LINUX_VERSION-5.15 = .23/LINUX_VERSION-5.15 = .24/g' ./include/kernel-5.15

