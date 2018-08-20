# Supported tags and respective `Dockerfile` links

- [`2.0.2.18`, `latest` (*stretch/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/stretch/Dockerfile)
- [`alpine` (*alpine/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/alpine/Dockerfile)
- [`xenial` (*xenial/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/xenial/Dockerfile)
- [`1.1.1.18` (*stretch/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/v1.8/stretch/Dockerfile)
- [`1.1.1.18-alpine` (*alpine/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/v1.8/alpine/Dockerfile)
- [`1.1.1.18-xenial` (*xenial/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/v1.8/xenial/Dockerfile)
- [`1.0.1.17` (*jessie/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/v1.7/jessie/Dockerfile)
- [`1.0.1.17-alpine` (*alpine/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/v1.7/alpine/Dockerfile)
- [`1.0.1.17-xenial` (*xenial/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/v1.7/xenial/Dockerfile)

# Quick reference

- **Where to get help**:  
  [Github issues](https://github.com/jiangwenyuan/nuster/issues)

- **Where to file issues**:  
  [https://github.com/jiangwenyuan/docker-nuster/issues](https://github.com/jiangwenyuan/docker-nuster/issues)

- **Maintained by**:  
  [nuster](https://github.com/jiangwenyuan)

# What is nuster?

[nuster](https://github.com/jiangwenyuan/nuster) is a caching proxy server based on HAProxy.


# How to use this image

## Create a `Dockerfile`

```Dockerfile
FROM nuster/nuster
COPY nuster.cfg /etc/nuster/nuster.cfg
```

## Build the container

```console
$ docker build -t my-nuster .
```

## Test the configuration file

```console
$ docker run -it --rm my-nuster nuster -c -f /etc/nuster/nuster.cfg
```

## Run the container

```console
$ docker run -d my-nuster
```

## Directly via bind mount

```console
$ docker run -d -p 8080:8080 -v /path/to/nuster.cfg:/etc/nuster/nuster.cfg:ro nuster/nuster
```
