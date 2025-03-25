FROM alpine:latest
RUN apk --update add ca-certificates \
                     mailcap \
                     curl \
                     jq

EXPOSE 8080

COPY docker_config.json /.filebrowser.json
COPY filebrowser /filebrowser
