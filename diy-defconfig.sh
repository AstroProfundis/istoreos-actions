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
