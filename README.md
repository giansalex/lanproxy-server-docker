# Lanproxy Server - Docker Image
[![Docker Build Status](https://img.shields.io/docker/cloud/build/giansalex/lanproxy-server.svg?style=flat-square)](https://hub.docker.com/r/giansalex/lanproxy-server/)

[Lanproxy server](https://github.com/ffay/lanproxy) as Docker Image.

## Usage
Basic example

```sh
docker run -d \
    --name lanproxy-server \
    -p 8090:8090 \
    -p 4900:4900 \
    -p 4993:4993 \
    -p 9100-9200:9100-9200 \
    giansalex/lanproxy-server
```

> Change range port `9000-9100` as you need. 

**Advance Example**    
Create `config.properties` and change paremeters.

```yml
server.bind=0.0.0.0

# Lanproxy Port
server.port=4900

# SSL config
server.ssl.enable=false

# Web UI
config.server.bind=0.0.0.0
config.server.port=8090
config.admin.username=admin
config.admin.password=changeme
```

Start container
```sh
docker run -d \
    --name lanproxy-server \
    -v "$(pwd)"/config.properties:/lanproxy/conf/config.properties \
    -p 8090:8090 \
    -p 4900:4900 \
    -p 9100-9200:9100-9200 \
    giansalex/lanproxy-server
```
