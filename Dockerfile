FROM scratch

ADD rootfs.tar.xz /

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV LANG=C.UTF-8

CMD tail -f /dev/null