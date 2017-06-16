FROM haproxy:1.7-alpine

ENV PORT 8000
ENV JAIL /srv/jail

EXPOSE $PORT

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

RUN mkdir -m 555 $JAIL
