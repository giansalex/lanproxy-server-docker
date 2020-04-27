# Lanproxy Server - Docker Image
[![Docker Build Status](https://img.shields.io/docker/build/giansalex/lanproxy-server-docker.svg?style=flat-square)](https://hub.docker.com/r/giansalex/lanproxy-server-docker/)

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

Change range port `9000-9100` as you need. 

**Advance Example**
Change [conf](https://github.com/giansalex/lanproxy-server-docker/tree/master/conf) files.

Start container
```sh
docker run -d \
    --name lanproxy-server \
    --mount type=bind,source="$(pwd)"/conf,target=/lanproxy/conf \
    -p 8090:8090 \
    -p 4900:4900 \
    -p 9100-9200:9100-9200 \
    giansalex/lanproxy-server
```
