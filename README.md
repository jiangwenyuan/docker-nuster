# Supported tags and respective `Dockerfile` links

- [`1.7.9.4`, `1.7.9`, `1.7`, `latest` (*debian/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/470e029cf45731e828f6dd045c5909b2ce8bc7a5/debian/Dockerfile)
- [`1.7.9.4-alpine`, `1.7.9-alpine`, `1.7-alpine` (*alpine/Dockerfile*)](https://github.com/jiangwenyuan/docker-nuster/blob/470e029cf45731e828f6dd045c5909b2ce8bc7a5/alpine/Dockerfile)

# Quick reference

- **Where to get help**:  
  [Github issues](https://github.com/jiangwenyuan/nuster/issues)

- **Where to file issues**:  
  [https://github.com/jiangwenyuan/docker-nuster/issues](https://github.com/jiangwenyuan/docker-nuster/issues)

- **Maintained by**:  
  [nuster](https://github.com/jiangwenyuan)

# What is nuster?

[nuster](https://github.com/jiangwenyuan/nuster) is a web caching proxy server based on HAProxy.


# How to use this image

## Create a `Dockerfile`

```Dockerfile
FROM nuster:1.7.9
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
$ docker run -d -p 8080:8080 -v /path/to/nuster.cfg:/etc/nuster/nuster.cfg:ro nuster/nuster:1.7
```
