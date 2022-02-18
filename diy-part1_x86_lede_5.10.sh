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
wget -O ./package/lean/autocore/files/x86/index.htm https://raw.githubusercontent.com/kissyouhunter/openwrt_X86/main/diy/x86_lede/index_x86.htm

# 替换banner
wget -O ./package/base-files/files/etc/banner https://raw.githubusercontent.com/kissyouhunter/openwrt_X86/main/diy/x86_lede/banner

# 替换内核
#sed -i 's/PATCHVER:=5.4/PATCHVER:=5.10/g' ./target/linux/x86/Makefile

# 内核替换成 kernel 5.10.90

#sed -i 's/LINUX_KERNEL_HASH-5.10.98 = 1b24c6c15f1011bcca54da7e58539c612c7c84f95b7902f62d34754aaf0f9443/LINUX_KERNEL_HASH-5.10.99 = 00a53558aad3d8638bbe3bb69ed82a2b5b58ed3af01596bc18686cd04a790449/g' ./include/kernel-5.10

#sed -i 's/LINUX_VERSION-5.10 = .98/LINUX_VERSION-5.10 = .99/g' ./include/kernel-5.10

