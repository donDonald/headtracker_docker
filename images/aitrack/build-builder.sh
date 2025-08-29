#!/bin/bash

IMAGE_NAME=${1:-"aitrack-builder"}
DOCKER_FILE=${2:-"./Dockerfile-builder"}
FLAGS=" $3 "
TAG=v1.0

docker build \
    --build-arg USER_NAME=somebody \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    -t "$IMAGE_NAME" \
    $FLAGS \
    -f $DOCKER_FILE \
    . \
&& docker image tag "$IMAGE_NAME" "$IMAGE_NAME:$TAG"
