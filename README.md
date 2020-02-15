* latest: build from github master branch
* stable: build from the latest stable release

# Supported tags and respective `Dockerfile` links

- [`latest` (*/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/Dockerfile)
- [`3.2.3.19-stretch`, `3.2.3.19`, `stable` (*H1.9/stretch/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/H1.9/stretch/Dockerfile)
- [`3.2.3.19-alpine` (*H1.9/alpine/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/H1.9/alpine/Dockerfile)
- [`3.2.3.19-xenial` (*H1.9/xenial/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/H1.9/xenial/Dockerfile)
- [`3.2.3.19-centos7` (*H1.9/centos7/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/H1.9/centos7/Dockerfile)
- [`2.0.13.18-stretch`, `2.0.13.18` (*H1.8/stretch/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/H1.8/stretch/Dockerfile)
- [`2.0.13.18-alpine` (*H1.8/alpine/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/H1.8/alpine/Dockerfile)
- [`2.0.13.18-xenial` (*H1.8/xenial/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/H1.8/xenial/Dockerfile)
- [`2.0.13.18-centos7` (*H1.8/centos7/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/H1.8/centos7/Dockerfile)
- [`1.0.3.17-stretch`, `1.0.3.17` (*H1.7/stretch/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/H1.7/stretch/Dockerfile)
- [`1.0.3.17-alpine` (*H1.7/alpine/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/H1.7/alpine/Dockerfile)
- [`1.0.3.17-xenial` (*H1.7/xenial/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/H1.7/xenial/Dockerfile)
- [`1.0.3.17-centos7` (*H1.7/centos7/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/H1.7/centos7/Dockerfile)

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
