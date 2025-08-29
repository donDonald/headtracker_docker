#!/bin/bash

IMAGE_NAME=${1:-"aitrack"}
FLAGS=" $2 "




# Choosing the right GPU type to share the right device.
GPU_DEVICE_PARAMETERS=""
source $(dirname "$0")/gpu.sh
[ "$GPU_TYPE" = NVIDIA ] && GPU_DEVICE_PARAMETERS="--device=/dev/nvidiactl --device=/dev/nvidia-uvm --device=/dev/nvidia0"
[ "$GPU_TYPE" = INTEL ] && GPU_DEVICE_PARAMETERS="--device=/dev/dri:/dev/dri"
[ "$GPU_TYPE" = AMD ] && GPU_DEVICE_PARAMETERS="--device=/dev/dri:/dev/dri"




xhost +




docker run \
    -it \
    --rm \
    $FLAGS \
    --name $IMAGE_NAME \
    --privileged \
    --ipc="host" \
    --group-add video \
    --group-add render \
    -v /etc/timezone:/etc/timezone \
    -v /etc/localtime:/etc/localtime \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
    -e XDG_RUNTIME_DIR=/tmp \
    $GPU_DEVICE_PARAMETERS \
    $IMAGE_NAME
