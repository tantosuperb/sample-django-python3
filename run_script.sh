#!/bin/bash

BUILD_NAME=sample-image

docker rmi $BUILD_NAME
docker build -t $BUILD_NAME . 2>&1 || exit

# foreground -> script exit = docker process stop
#docker run --rm -p 8000:8000 -v "$(pwd)"/sample-vol:/app --name $BUILD_NAME $BUILD_NAME
docker run --rm -p 8000:8000 --name $BUILD_NAME $BUILD_NAME

# background -> must docker stop manually for process exit
# docker run -d --rm -p 8000:8000 --name $BUILD_NAME $BUILD_NAME
# docker stop $BUILD_NAME
