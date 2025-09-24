#!/bin/bash

pushd aitrack \
 && bash build.sh \
 && popd \
 && pushd opentrack \
 && bash build.sh \
 && popd \
 && pushd linuxtrack \
 && bash build.sh \
 && popd
