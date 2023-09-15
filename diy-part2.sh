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

# 添加自定义软件包
echo '
CONFIG_PACKAGE_adguardhome=y
CONFIG_PACKAGE_babeld=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_bind-dig=y
CONFIG_PACKAGE_bird2=y
CONFIG_PACKAGE_bird2c=y
CONFIG_PACKAGE_dnscrypt-proxy2=y
CONFIG_PACKAGE_git=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_iftop=y
CONFIG_PACKAGE_nebula=y
CONFIG_PACKAGE_ntpd=y
CONFIG_PACKAGE_ntpdate=y
CONFIG_PACKAGE_tinc=y
CONFIG_PACKAGE_wireguard-tools=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-wireguard=y
CONFIG_PACKAGE_luci-proto-nebula=y
CONFIG_PACKAGE_luci-proto-vxlan=y
' >> .config