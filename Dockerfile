FROM alpine:3.15

COPY src/ /

RUN apk --update upgrade && \
 apk add bash nfs-utils && \
 rm -rf /var/cache/apk/*

RUN chmod a+x /*.sh

EXPOSE 111/tcp 111/udp 2049/tcp 2049/udp 32765/tcp 32765/udp 32766/tcp 32766/udp 32767/tcp 32767/udp

ENTRYPOINT ["/start-container.sh"]
