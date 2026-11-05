# 多阶段构建：官方 xray 镜像无 shell，直接把二进制拷进干净的 Alpine
FROM ghcr.io/xtls/xray-core:latest AS xray

FROM alpine:3.20
COPY --from=xray /usr/local/bin/xray /usr/bin/xray
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 3000
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
