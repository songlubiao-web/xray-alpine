#!/bin/sh
# 启动时用环境变量渲染占位符，镜像内不落任何秘密
sed -i "s|@UUID@|${XRAY_UUID:?XRAY_UUID not set}|; s|@WSPATH@|${XRAY_PATH:?XRAY_PATH not set}|" /etc/xray/config.json
exec /usr/bin/xray run -c /etc/xray/config.json
