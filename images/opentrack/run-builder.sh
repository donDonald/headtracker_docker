#!/bin/bash

IMAGE_NAME=${1:-"opentrack-builder"}
FLAGS=" $2 "
OPENTRACK_VERSION=opentrack-2024.1.1




docker run \
    -it \
    --rm \
    $FLAGS \
    -v /etc/timezone:/etc/timezone \
    -v /etc/localtime:/etc/localtime \
    -v ./files:/home/somebody/builder-output \
    -e OPENTRACK_VERSION=$OPENTRACK_VERSION \
    $IMAGE_NAME
