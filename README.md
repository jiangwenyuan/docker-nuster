# Supported tags and respective `Dockerfile` links

-       [`1.7.9.3`, `1.7.9`, `1.7`, `latest` (*debian/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster)
-       [`1.7.9.3-alpine`, `1.7.9-alpine`, `1.7-alpine` (*alpine/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster)

# Quick reference

-       **Where to get help**:  
        [Github issues](https://github.com/jiangwenyuan/nuster/issues)

-       **Where to file issues**:  
        [https://github.com/jiangwenyuan/docker-nuster/issues](https://github.com/jiangwenyuan/docker-nuster/issues)

-       **Maintained by**:  
        [nuster](https://github.com/jiangwenyuan)

# What is nuster?

[nuster](https://github.com/jiangwenyuan/nuster) is a web caching proxy server based on HAProxy.


# How to use this image

## Create a `Dockerfile`

```Dockerfile
FROM nuster:1.7.9.3
COPY nuster.cfg /etc/nuster/nuster.cfg
```

## Build the container

```console
$ docker build -t my-nuster .
```

## Test the configuration file

```console
$ docker run -it --rm my-nuster haproxy -c -f /etc/nuster/nuster.cfg
```

## Run the container

```console
$ docker run -d my-nuster
```

## Directly via bind mount

```console
$ docker run -d --name nuster-running -v /path/to/nuster.cfg:/etc/nuster/nuster.cfg:ro nuster:1.7
```
