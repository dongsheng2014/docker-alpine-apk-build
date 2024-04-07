FROM alpine:3.19
RUN apk update && apk add --no-cache alpine-sdk doas
RUN adduser -D -s /bin/sh -G abuild -h /home/alpine alpine && \
    mkdir -p /var/cache/distfiles
USER alpine
WORKDIR /home/alpine
COPY --chown=alpine keys .abuild
ENTRYPOINT ["sh"]