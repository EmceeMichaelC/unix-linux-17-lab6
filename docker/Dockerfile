from ubuntu:xenial

RUN apt-get update && apt-get -y install rsyslog && rm /etc/rsyslog.d/50-default.conf

COPY etc/rsyslog.d/10-server.conf /etc/rsyslog.d/
COPY etc/rsyslog.conf /etc/rsyslog.conf

EXPOSE 514 514/udp

ENTRYPOINT [ "rsyslogd", "-n" ]
