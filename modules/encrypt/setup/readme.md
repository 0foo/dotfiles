# Simple Python Http Server Docker Image

## Introduction


## How to build

```
docker build . -t <image name>
docker build . -t transientdesign/mutant-encrypt
```

## How to run

## Usage:

The container the following mounted folders

* "/data" --> mount the folder to be served

Run the container with:

```
docker run --rm -it -v /PATH/TO/MOUNT:/data mutant-encrypt
```
