FROM debian:latest

RUN apt-get update && apt-get install -y tzdata openntpd \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

ENV TZ=Asia/Shanghai

RUN apt-get install -y qemu-utils

WORKDIR /opt

COPY ./filebrowser /opt/filebrowser
