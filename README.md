# luzifer-docker / grafana-prometheus

This container currently only contains the [Grafana](http://grafana.org/) 2.0.2.

## Running your Grafana image
--------------------------

Start your image binding the external port `3000`.

   docker run -i -p 3000:3000 grafana/grafana

Try it out, default admin user is admin/admin.


## Configuring your Grafana container

All options defined in conf/grafana.ini can be overriden using environment variables, for example:

```
docker run -i -p 3000:3000 \
  -e "GF_SERVER_ROOT_URL=http://grafana.server.name"  \
  -e "GF_SECURITY_ADMIN_PASSWORD=secret  \
  grafana/grafana
```


