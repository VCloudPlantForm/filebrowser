FROM swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/library/golang:1.22.3 AS builder


WORKDIR /opt

COPY . .

RUN go env -w GO111MODULE=on \
    && go env -w CGO_ENABLED=0 \
    && go env \
    && go mod tidy \
    && go build -o filebrowser .

FROM alpine:latest

RUN apt-get update && apt-get install -y tzdata openntpd \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

ENV TZ=Asia/Shanghai

WORKDIR /opt

COPY --from=0 /opt/filebrowser ./
