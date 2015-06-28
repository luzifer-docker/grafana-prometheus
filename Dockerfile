FROM grafana/grafana:latest

RUN apt-get update \
 && apt-get install -y unzip \
 && cd /tmp \
 && wget https://github.com/grafana/grafana-plugins/archive/master.zip \
 && unzip master.zip \
 && cp -R grafana-plugins-master/datasources/prometheus /usr/share/grafana/public/app/plugins/datasource/
