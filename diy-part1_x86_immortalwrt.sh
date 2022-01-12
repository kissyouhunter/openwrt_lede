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

# 内核替换成 kernel 4.19.224

sed -i 's/LINUX_KERNEL_HASH-4.19.222 = 97b0830c3d7d90acfc850bcbfdeb64e6cb3e1cb58e079b8b7d0f5bb0a9618838/LINUX_KERNEL_HASH-4.19.224 = 01ccfc3413c3bb305653ceb0aa528aba0caa61b326e43709bf1f8b624f211031/g' ./include/kernel-version.mk

sed -i 's/LINUX_VERSION-4.19 = .222/LINUX_VERSION-4.19 = .224/g' ./include/kernel-version.mk
