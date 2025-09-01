#!/bin/bash

IMAGE_NAME=${1:-"linuxtrack"}
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
    --privileged \
    --cap-add=SYS_PTRACE \
    --ulimit core=-1 \
    --name $IMAGE_NAME \
    --ipc="host" \
    --group-add video \
    --group-add render \
    -v /etc/timezone:/etc/timezone \
    -v /etc/localtime:/etc/localtime \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /run/user/$(id -g):/run/user/$(id -g) \
    -e DISPLAY=$DISPLAY \
    -e XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR \
    -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
    $GPU_DEVICE_PARAMETERS \
    $IMAGE_NAME
