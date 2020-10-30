FROM alpine:3.12 AS runtime

LABEL maintainer=frits@gcompany.nl

RUN apk --no-cache add pgbouncer --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    && sed -i '/^logfile = /s/\/.*/\/dev\/stdout/' /etc/pgbouncer/pgbouncer.ini

USER nobody

ENTRYPOINT ["pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]
