#!/bin/bash

IMAGE_NAME=${1:-"opentrack"}
DOCKER_FILE=${2:-"./Dockerfile"}
FLAGS=" $3 "
OPENTRACK_VERSION=opentrack-2024.1.1
TAG=v1.0

docker build \
    --build-arg USER_NAME=somebody \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    --build-arg OPENTRACK_VERSION=$OPENTRACK_VERSION \
    -t "$IMAGE_NAME-$OPENTRACK_VERSION" \
    $FLAGS \
    -f $DOCKER_FILE \
    . \
&& docker image tag "$IMAGE_NAME-$OPENTRACK_VERSION" "$IMAGE_NAME:$TAG" \
&& docker image tag "$IMAGE_NAME-$OPENTRACK_VERSION" "$IMAGE_NAME"
