FROM debian:jessie

ENV GRAFANA_VERSION 2.1.3
ENV PLUGINS_VERSION 57055f72c4745abe6c33a26359ebfb6e59920345

RUN apt-get update \
 && apt-get install -y unzip libfontconfig wget adduser openssl ca-certificates \
 && wget https://grafanarel.s3.amazonaws.com/builds/grafana_${GRAFANA_VERSION}_amd64.deb \
 && dpkg -i grafana_${GRAFANA_VERSION}_amd64.deb \
 && cd /tmp \
 && wget https://github.com/grafana/grafana-plugins/archive/${PLUGINS_VERSION}.zip \
 && unzip ${PLUGINS_VERSION}.zip \
 && cp -R grafana-plugins-*/datasources/prometheus /usr/share/grafana/public/app/plugins/datasource/

EXPOSE 3000

VOLUME ["/var/lib/grafana"]
VOLUME ["/var/log/grafana"]
VOLUME ["/etc/grafana"]

WORKDIR /usr/share/grafana

ENTRYPOINT ["/usr/sbin/grafana-server"]
CMD [ \
  "--config", \
  "/etc/grafana/grafana.ini", \
  "cfg:default.paths.data=/var/lib/grafana", \
  "cfg:default.paths.logs=/var/log/grafana" \
]
