#!/bin/bash

IMAGE_NAME=${1:-"linuxtrack-builder"}
FLAGS=" $2 "
LINUXTRACK_VERSION=master




docker run \
    -it \
    --rm \
    $FLAGS \
    -v /etc/timezone:/etc/timezone \
    -v /etc/localtime:/etc/localtime \
    -v ./files:/home/somebody/builder-output \
    -e LINUXTRACK_VERSION=$LINUXTRACK_VERSION \
    $IMAGE_NAME
