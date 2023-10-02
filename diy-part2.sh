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

# 添加自定义软件包
echo '
CONFIG_PACKAGE_adguardhome=y
CONFIG_PACKAGE_apfree-wifidog=y
CONFIG_PACKAGE_babeld=y
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_bind-dig=y
CONFIG_PACKAGE_bird2=y
CONFIG_PACKAGE_bird2c=y
CONFIG_PACKAGE_dnscrypt-proxy2=y
CONFIG_PACKAGE_git=y
CONFIG_PACKAGE_gpsd=y
CONFIG_PACKAGE_gpsd-clients=y
CONFIG_PACKAGE_gpsd-utils=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_iftop=y
CONFIG_PACKAGE_iperf=y
CONFIG_PACKAGE_iperf3=y
CONFIG_PACKAGE_jq=y
CONFIG_PACKAGE_less=y
CONFIG_PACKAGE_lsof=y
CONFIG_PACKAGE_lm-sensors=y
CONFIG_PACKAGE_lm-sensors-detect=y
CONFIG_PACKAGE_minicom=y
CONFIG_PACKAGE_modemmanager=y
CONFIG_PACKAGE_nebula=y
CONFIG_PACKAGE_nebula-proto=y
CONFIG_PACKAGE_nebula-service=y
CONFIG_PACKAGE_ntpd=y
CONFIG_PACKAGE_ntpdate=y
CONFIG_PACKAGE_tinc=y
CONFIG_PACKAGE_tmux=y
CONFIG_PACKAGE_ttyd=y
CONFIG_PACKAGE_wireguard-tools=y
CONFIG_PACKAGE_luci-app-advanced-reboot=y
CONFIG_PACKAGE_luci-app-argon-config=y
CONFIG_PACKAGE_luci-app-commands=y
CONFIG_PACKAGE_luci-app-cpufreq=y
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_luci-app-ntpc=y
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-app-smartdns=y
CONFIG_PACKAGE_luci-app-wireguard=y
CONFIG_PACKAGE_luci-proto-3g=y
CONFIG_PACKAGE_luci-proto-bonding=y
CONFIG_PACKAGE_luci-proto-ipv6=y
CONFIG_PACKAGE_luci-proto-modemmanager=y
CONFIG_PACKAGE_luci-proto-ncm=y
CONFIG_PACKAGE_luci-proto-nebula=y
CONFIG_PACKAGE_luci-proto-ppp=y
CONFIG_PACKAGE_luci-proto-qmi=y
CONFIG_PACKAGE_luci-proto-vxlan=y
' >> .config

echo '
CONFIG_PACKAGE_python3=y
CONFIG_PACKAGE_python3-babel=y
CONFIG_PACKAGE_python3-cachelib=y
CONFIG_PACKAGE_python3-cffi=y
CONFIG_PACKAGE_python3-cgi=y
CONFIG_PACKAGE_python3-flask=y
CONFIG_PACKAGE_python3-flask-babel=y
CONFIG_PACKAGE_python3-flask-httpauth=y
CONFIG_PACKAGE_python3-flask-login=y
CONFIG_PACKAGE_python3-flask-seasurf=y
CONFIG_PACKAGE_python3-flask-session=y
CONFIG_PACKAGE_python3-flask-socketio=y
CONFIG_PACKAGE_python3-ifaddr=y
CONFIG_PACKAGE_python3-netifaces=y
CONFIG_PACKAGE_python3-newt=y
CONFIG_PACKAGE_python3-passlib=y
CONFIG_PACKAGE_python3-pillow=y
CONFIG_PACKAGE_python3-ply=y
CONFIG_PACKAGE_python3-psutil=y
CONFIG_PACKAGE_python3-pycparser=y
CONFIG_PACKAGE_python3-pyserial=y
CONFIG_PACKAGE_python3-pysocks=y
CONFIG_PACKAGE_python3-pytz=y
CONFIG_PACKAGE_python3-requests=y
CONFIG_PACKAGE_python3-uuid=y
CONFIG_PACKAGE_python3-yaml=y
CONFIG_PACKAGE_ruby=y
CONFIG_PACKAGE_ruby-bigdecimal=y
CONFIG_PACKAGE_ruby-date=y
CONFIG_PACKAGE_ruby-digest=y
CONFIG_PACKAGE_ruby-enc=y
CONFIG_PACKAGE_ruby-forwardable=y
CONFIG_PACKAGE_ruby-pstore=y
CONFIG_PACKAGE_ruby-psych=y
CONFIG_PACKAGE_ruby-stringio=y
CONFIG_PACKAGE_ruby-strscan=y
CONFIG_PACKAGE_ruby-yaml=y
' >> .config

sed -i "/nct6775/d" .config

#sed -i "s/ucidef_set_interface_lan 'eth0'/ucidef_set_interface_lan 'eth1'/g" package/base-files/files/etc/board.d/99-default_network
#sed -i "s/ucidef_set_interface_wan 'eth1'/ucidef_set_interface_wan 'eth0'/g" package/base-files/files/etc/board.d/99-default_network
