FROM alpine:latest

VOLUME /downloads

EXPOSE 6800

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD aria2c --conf-path=/etc/aria2.conf

RUN apk add --no-cache aria2
