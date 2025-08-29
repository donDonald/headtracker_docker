#!/bin/bash

cd /home/$USER/builder-output \

DIRECTORY=opentrack
if [ -d "$DIRECTORY" ]; then
    echo "Directory 'files/$DIRECTORY' exists. Remove it to rebuild from scratch. Exiting."
    exit 0
fi

git clone https://github.com/opentrack/opentrack.git \
 && cd opentrack \
 && git checkout $OPENTRACK_VERSION \
 && mkdir build \
 && cd build \
 && cmake .. \
 && make -j$(nproc) | tee 1.make.log \
 && make install | tee 2.make.install.log \
 && cd install \
 && tar -czvf ../opentrack-$OPENTRACK_VERSION-bin.tar.gz ./* \
 && cp ../opentrack-$OPENTRACK_VERSION-bin.tar.gz ~/builder-output
