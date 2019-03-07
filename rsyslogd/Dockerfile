FROM alpine

RUN apk add --no-cache rsyslog && \
    rm -rf /etc/rsyslog* /etc/logrotate*

COPY ./rsyslog.conf /etc/rsyslog.conf

USER nobody
EXPOSE 5140/udp
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslog.conf"]
