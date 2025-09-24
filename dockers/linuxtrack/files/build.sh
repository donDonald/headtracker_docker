#!/bin/bash

cd /home/$USER/builder-output \

DIRECTORY=linuxtrack
if [ -d "$DIRECTORY" ]; then
    echo "Directory 'files/$DIRECTORY' exists. Remove it to rebuild from scratch. Exiting."
    exit 0
fi

git clone https://github.com/RavenX8/linuxtrack.git \
 && cd linuxtrack \
 && git checkout $LINUXTRACK_VERSION \
 && mkdir install \
 && ./configure --prefix=$(pwd)/install \
 && make -j$(nproc) | tee 1.make.log \
 && make install | tee 2.make-install.log \
 && cd install \
 && tar -czvf ../linuxtrack-$LINUXTRACK_VERSION-bin.tar.gz ./* \
 && cp ../linuxtrack-$LINUXTRACK_VERSION-bin.tar.gz ~/builder-output
