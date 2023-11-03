#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改openwrt登陆地址,把下面的 192.168.10.1 修改成你想要的就可以了
sed -i 's/192.168.1.1/172.23.33.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.100.1/172.23.33.1/g' package/istoreos-files/Makefile

# 修改主机名字，把 iStore OS 修改你喜欢的就行（不能纯数字或者使用中文）
# sed -i 's/OpenWrt/iStore OS/g' package/base-files/files/bin/config_generate

# ttyd 自动登录
# sed -i "s?/bin/login?/usr/libexec/login.sh?g" ${GITHUB_WORKSPACE}/openwrt/package/feeds/packages/ttyd/files/ttyd.config

# 更改默认 Shell 为 bash
sed -i 's/\/bin\/ash/\/bin\/bash/g' package/base-files/files/etc/passwd

# 更改 Argon 主题背景
cp -f $GITHUB_WORKSPACE/images/bg1.jpg feeds/third/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# 移除要替换的包
rm -rf feeds/packages/net/mosdns
rm -rf package/feeds/packages/mosdns

rm -rf feeds/packages/net/msd_lite
rm -rf package/feeds/packages/msd_lite

rm -rf feeds/packages/net/smartdns
rm -rf package/feeds/packages/smartdns

rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf package/feeds/luci/luci-app-mosdns

rm -rf feeds/luci/applications/luci-app-msd_lite
rm -rf package/feeds/luci/luci-app-msd_lite

rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf package/feeds/luci/luci-app-smartdns

rm -rf feeds/luci/themes/luci-theme-argon
rm -rf package/feeds/luci/luci-theme-argon

# 添加额外插件
git clone --depth=1 https://github.com/ximiTech/luci-app-msd_lite package/luci-app-msd_lite
git clone --depth=1 https://github.com/ximiTech/msd_lite package/msd_lite
git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
git clone --depth=1 https://github.com/pymumu/openwrt-smartdns package/smartdns
svn export https://github.com/sbwml/luci-app-mosdns/trunk/luci-app-mosdns package/luci-app-mosdns
svn export https://github.com/sbwml/luci-app-mosdns/trunk/mosdns package/mosdns
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
svn export https://github.com/immortalwrt/luci/branches/openwrt-21.02/applications/luci-app-eqos package/luci-app-eqos
git clone --depth=1 -b master https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

svn export https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
sed -i "s|kernel_path.*|kernel_path 'https://github.com/ophub/kernel'|g" package/luci-app-amlogic/root/etc/config/amlogic

#sed -i "s/ucidef_set_interface_lan 'eth0'/ucidef_set_interface_lan 'eth1'/g" package/base-files/files/etc/board.d/99-default_network
#sed -i "s/ucidef_set_interface_wan 'eth1'/ucidef_set_interface_wan 'eth0'/g" package/base-files/files/etc/board.d/99-default_network
