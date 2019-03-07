FROM haproxy:1.7-alpine

ENV PORT 8000
ENV JAIL /srv/jail

EXPOSE $PORT

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY healthcheck.http /etc/haproxy/errors/healthcheck.http

RUN mkdir -m 555 $JAIL

ENTRYPOINT [ "haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg", "-p", "/dev/null", "-db" ]
