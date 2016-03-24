# Rancher Container Configuration

This is a generic sidekick container that writes data from Rancher's
MetaData API into a standard configuration file (`/config/app.conf`).

This volume can then be mounted into any container using Docker's
volume aliasing (as of v1.9).

```yml
app:
  restart: always
  image: myorg/app
  labels:
    io.rancher.sidekicks: app-conf
  volumes_from:
    - app-conf:/config/app.conf:/myapp/application.properties
app-conf:
  restart: always
  images: objectpartners/rancher-container-conf:latest
```
