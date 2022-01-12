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

# 下载插件
svn co https://github.com/kissyouhunter/openwrt-packages/trunk/luci-app-poweroff ./package/luci-app-poweroff

# 替换index.htm文件 X86
wget -O ./package/emortal/autocore/files/generic/index.htm https://raw.githubusercontent.com/kissyouhunter/openwrt_X86/main/diy/x86_immortalwrt/index_x86_immortalwrt.htm

# 替换banner
wget -O ./package/emortal/default-settings/files/openwrt_banner https://raw.githubusercontent.com/kissyouhunter/openwrt_X86/main/diy/x86_immortalwrt/openwrt_banner

# 替换内核
sed -i 's/PATCHVER:=4.19/PATCHVER:=4.14/g' ./target/linux/x86/Makefile

# 内核替换成 kernel 4.14.261

sed -i 's/LINUX_KERNEL_HASH-4.14.259 = 26e284541ff77bd3af14e40aa690bcf229d0f9b9677704fd9fecb59e108e4368/LINUX_KERNEL_HASH-4.14.261 = bffaaa4c93ab4ed1de61f804c26c92b82dd80f92793e20194b62497d7b8b4723/g' ./include/kernel-version.mk

sed -i 's/LINUX_VERSION-4.14 = .259/LINUX_VERSION-4.14 = .261/g' ./include/kernel-version.mk

