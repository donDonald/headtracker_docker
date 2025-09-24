#!/bin/bash

cd /home/$USER/builder-output

DIRECTORY=aitrack-linux
if [ -d "$DIRECTORY" ]; then
    echo "Directory 'files/$DIRECTORY' exists. Remove it to rebuild from scratch. Exiting."
    exit 0
fi
 
git clone https://github.com/mdk97/aitrack-linux.git \
 && mv ~/onnxruntime-linux-x64-1.4.0.tgz ./aitrack-linux \
 && gunzip ./aitrack-linux/onnxruntime-linux-x64-1.4.0.tgz \
 && cd aitrack-linux \
 && git checkout $AITRACK_VERSION \
 && tar --extract -f ./onnxruntime-linux-x64-1.4.0.tar \
 && qmake -makefile \
 && make -j$(nproc) \
 && mkdir -p install/share/aitrack/models \
 && cp ./models/* install/share/aitrack/models \
 && mkdir -p install/lib \
 && cp ./onnxruntime-linux-x64-1.4.0/lib/libonnxruntime.so.1.4.0 install/lib \
 && mkdir -p install/bin \
 && cp ./aitrack install/bin \
 && cd install \
 && tar -czvf ../aitrack-linux-$AITRACK_VERSION-bin.tar.gz ./* \
 && cp ../aitrack-linux-$AITRACK_VERSION-bin.tar.gz ~/builder-output
