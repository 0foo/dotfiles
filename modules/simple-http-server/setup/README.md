# Simple Python Http Server Docker Image

## Introduction


## How to build

```
docker build . -t simple-http-server

```

## How to run

## Usage:

The container the following mounted folders

* "/data" --> mount the folder to be served

Run the container with:

```
docker run  \
    --rm \
    -it \
    -v /PATH/TO/MOUNT:/data \
    -p 8080:8080 \
    simple-http-server
```
