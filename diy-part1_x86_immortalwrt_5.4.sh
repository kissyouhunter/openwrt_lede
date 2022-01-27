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

# kernel 5.4.173

sed -i 's/LINUX_KERNEL_HASH-5.4.162 = c12d72ddaac78189305a5e98825295ecb02282970033b052276035e83189e25b/LINUX_KERNEL_HASH-5.4.173 = 99e8e275b239c708bdb6a41990c4d12098a61752245dbef921a514d9f996c239/g' ./include/kernel-version.mk

sed -i 's/LINUX_VERSION-5.4 = .162/LINUX_VERSION-5.4 = .173/g' ./include/kernel-version.mk
