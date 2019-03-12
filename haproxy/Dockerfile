FROM haproxy:1.7-alpine

ENV PORT=8000 \
    JAIL=/srv/jail \
    SYSLOG_PORT=5140 \
    SYSLOG_FACILITY=local0 \
    SYSLOG_LEVEL=info

EXPOSE $PORT

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY healthcheck.http /etc/haproxy/errors/healthcheck.http

RUN mkdir -m 555 $JAIL

ENTRYPOINT [ "haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg", "-p", "/dev/null", "-db" ]
