FROM alpine:3.12.0

LABEL version="1.0"
LABEL maintainer="Sleeyax"
LABEL description="configurable SSH tunnel using environment variables"

RUN apk add --update --no-cache openssh-client sshpass
EXPOSE ${SSH_LOCAL_PORT}
ENTRYPOINT sshpass -p ${SSH_PASSWORD} ssh -o stricthostkeychecking=no -N -L 0.0.0.0:${SSH_LOCAL_PORT}:${SSH_SERVER_IP}:${SSH_SERVER_PORT} ${SSH_USERNAME}@${SSH_SERVER_DOMAIN}
