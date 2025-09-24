#!/bin/bash

IMAGE_NAME=${1:-"linuxtrack"}
DOCKER_FILE=${2:-"./Dockerfile"}
FLAGS=" $3 "
LINUXTRACK_VERSION=master
TAG=v1.0

docker build \
    --build-arg USER_NAME=somebody \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    --build-arg LINUXTRACK_VERSION=$LINUXTRACK_VERSION \
    -t "$IMAGE_NAME-$LINUXTRACK_VERSION" \
    $FLAGS \
    -f $DOCKER_FILE \
    . \
&& docker image tag "$IMAGE_NAME-$LINUXTRACK_VERSION" "$IMAGE_NAME:$TAG" \
&& docker image tag "$IMAGE_NAME-$LINUXTRACK_VERSION" "$IMAGE_NAME"
