
# Supported tags and respective `Dockerfile` links

- [`master` (*/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/Dockerfile)
- [`5.2-buster`, `5.2`, `stable`, `latest` (*5.2/stretch/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.2/buster/Dockerfile)
- [`5.2-alpine` (*5.2/alpine/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.2/alpine/Dockerfile)
- [`5.2-xenial` (*5.2/xenial/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.2/xenial/Dockerfile)
- [`5.2-centos7` (*5.2/centos7/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.2/centos7/Dockerfile)
- [`5.1-buster`, `5.1` (*5.1/stretch/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.1/buster/Dockerfile)
- [`5.1-alpine` (*5.1/alpine/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.1/alpine/Dockerfile)
- [`5.1-xenial` (*5.1/xenial/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.1/xenial/Dockerfile)
- [`5.1-centos7` (*5.1/centos7/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.1/centos7/Dockerfile)

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
