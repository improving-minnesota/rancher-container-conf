# Rancher Container Configuration

This is a generic sidekick container that writes data from Rancher's
MetaData API into the specified arbitrary file.

This volume can then be mounted into any container using Docker's
volume aliasing (as of v1.9).

```yml
app:
  restart: always
  image: myorg/app
  labels:
    io.rancher.sidekicks: app-conf
  volumes_from:
    - app-conf
app-conf:
  restart: always
  images: objectpartners/rancher-container-conf:latest
```

Then configure the configuration data in `rancher-compose.yml`

```yml
app:
  metadata:
    config:
      content: |
        foo: bar
      path: '/config/app.conf'
```

You can also provide multiple files by namespacing the configuration:

```yml
app:
  restart: always
  image: myorg/app
  labels:
    io.rancher.sidekicks: app-conf,app-key
  volumes_from:
    - app-conf
    - app-key
app-conf:
  restart: always
  images: objectpartners/rancher-container-conf:latest
  command: config/app # Configures a namespace for the config
  volumes:
    - /config/app # Export the sub-folder to not collide with other config
app-key:
  restart: always
  images: objectpartners/rancher-container-conf:latest
  command: config/key # Configures a namespace for the config
  volumes:
    - /config/key # Export the sub-folder to not collide with other config
```

And configure multiple spaces in `rancher-compose.yml`

```yml
app:
  metadata:
    config:
      app:
        content: |
          foo: bar
        path: '/config/app/app.conf'
      key:
        content: |
          some randome key text
        path: '/config/key/key.pem'
```
