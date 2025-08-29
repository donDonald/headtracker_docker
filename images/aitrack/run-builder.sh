#!/bin/bash

IMAGE_NAME=${1:-"aitrack-builder"}
FLAGS=" $2 "
AITRACK_VERSION=master




docker run \
    -it \
    --rm \
    $FLAGS \
    --name $IMAGE_NAME \
    -v /etc/timezone:/etc/timezone \
    -v /etc/localtime:/etc/localtime \
    -v ./files:/home/somebody/builder-output \
    -e AITRACK_VERSION=$AITRACK_VERSION \
    $GPU_DEVICE_PARAMETERS \
    $IMAGE_NAME
