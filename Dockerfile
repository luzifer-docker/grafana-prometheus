FROM debian:wheezy

ENV GRAFANA_VERSION 2.0.2

RUN apt-get update \
 && apt-get install -y unzip libfontconfig wget adduser openssl ca-certificates \
 && wget https://grafanarel.s3.amazonaws.com/builds/grafana_${GRAFANA_VERSION}_amd64.deb \
 && dpkg -i grafana_${GRAFANA_VERSION}_amd64.deb \
 && cd /tmp \
 && wget https://github.com/grafana/grafana-plugins/archive/master.zip \
 && unzip master.zip \
 && cp -R grafana-plugins-master/datasources/prometheus /usr/share/grafana/public/app/plugins/datasource/

EXPOSE 3000

VOLUME ["/var/lib/grafana"]
VOLUME ["/var/log/grafana"]
VOLUME ["/etc/grafana"]

WORKDIR /usr/share/grafana

ENTRYPOINT ["/usr/sbin/grafana-server", "--config", "/etc/grafana/grafana.ini"]
