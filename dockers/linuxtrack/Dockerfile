FROM ubuntu:24.04
LABEL MAINTAINER="Pavel Taranov <pavel.a.taranov@gmail.com>"
LABEL DESCRIPTION="linuxtrack for head tracking"




ARG USER_NAME=nobody
ENV USER=$USER_NAME
ARG UID=2345
ARG GID=2345
ARG LINUXTRACK_VERSION=master




#To skip setting itimezonei, to set timezone: echo "Australia/Adelaide" | sudo tee /etc/timezone
ENV DEBIAN_FRONTEND=noninteractive




# Basic tools
RUN apt update \
 && apt install -y mc \
                   vim \
                   less \
                   sudo




# Linuxtrack dependencies
RUN apt update \
 && apt install -y libopencv-dev \
                   libproc2-dev \
                   libmxml-dev \
                   qtbase5-dev \
                   qttools5-dev \
                   qtbase5-private-dev \
                   xwayland \
                   x11-apps \
                   mesa-utils \
# Cleanup apt \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*




# Setup mc
RUN echo "regex/i/\.(md|log|txt|js|json|ejs|yml|j2|cfg|xml|sql|py|ipynb|sh)$\n    Include=editor" | tee -a /etc/mc/mc.ext.ini




# Create user
# Example: Change UID of 'ubuntu' user to 1001, then create 'myuser' with UID 1000
RUN usermod -u 1234 ubuntu && groupmod -g 1234 ubuntu
RUN groupadd -g $GID $USER
RUN useradd --shell /bin/bash --create-home -u $UID -g $GID $USER
RUN echo "${USER}:${USER}" | chpasswd
RUN usermod -aG sudo $USER
USER $USER
WORKDIR /home/$USER




# Setup vim
RUN echo "set tabstop=4\nset shiftwidth=4\nset softtabstop=4\nset expandtab" | tee -a /home/$USER/.vimrc \
 && echo "export EDITOR=vim" | tee -a /home/$USER/.bashrc




# Install opentrack
COPY --chown=$USER:$USER \
    files/linuxtrack-$LINUXTRACK_VERSION-bin.tar.gz \
    /home/$USER/

USER root
RUN tar -xzvf ./linuxtrack-$LINUXTRACK_VERSION-bin.tar.gz -C /usr \
 && rm ./linuxtrack-$LINUXTRACK_VERSION-bin.tar.gz
USER $USER
ENV LD_LIBRARY_PATH=/usr/lib/linuxtrack/




# Copy entrypoint and other scripts
COPY --chown=$USER:$USER\
     files/sysinfo.sh \
     /home/$USER/




#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["ltr_gui"]
