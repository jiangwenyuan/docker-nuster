
# Supported tags and respective `Dockerfile` links

- [`master` (*/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/Dockerfile)
- [`5.3-debian`, `5.3`, `5.3.0`, `5.3.0.23`, `latest` (*5.3/debian/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.3/debian/Dockerfile)
- [`5.3-alpine` (*5.3/alpine/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.3/alpine/Dockerfile)
- [`5.3-ubuntu` (*5.3/ubuntu/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.3/ubuntu/Dockerfile)
- [`5.2-debian`, `5.2`, `5.2.5`, `5.2.5.22`, `stable` (*5.2/debian/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.2/debian/Dockerfile)
- [`5.2-alpine` (*5.2/alpine/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.2/alpine/Dockerfile)
- [`5.2-ubuntu` (*5.2/ubuntu/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/master/5.2/ubuntu/Dockerfile)

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
