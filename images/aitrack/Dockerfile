FROM ubuntu:24.04
LABEL MAINTAINER="Pavel Taranov <pavel.a.taranov@gmail.com>"
LABEL DESCRIPTION="aitrack for head tracking"




ARG USER_NAME=nobody
ENV USER=$USER_NAME
ARG UID=2345
ARG GID=2345
ARG AITRACK_VERSION=master




#To skip setting itimezonei, to set timezone: echo "Australia/Adelaide" | sudo tee /etc/timezone
ENV DEBIAN_FRONTEND=noninteractive




# Basic tools
RUN apt update \
 && apt install -y mc \
                   vim \
                   less \
                   sudo




# Install pipewire audio subsystem
RUN apt update \
 && apt install -y pipewire \
                   pipewire-alsa \
                   mplayer \
                   alsa-base




RUN apt update \
 && apt install -y xwayland \
                   x11-apps \
                   mesa-utils




# https://github.com/mdk97/aitrack-linux
RUN apt update \
 && apt install -y qtbase5-dev \
                   qtbase5-dev-tools \
                   libqt5x11extras5-dev \
                   libopencv-dev \
                   libspdlog-dev \
#                  libfmt-dev \
#                  libomp-12-dev \
#                  qt5-default \
#                  libqt5x11extras5 \
#                  libspdlog1 \
#                  libomp5-12 \
                   libxsettings-dev \
                   libxsettings-client-dev \
# Cleanup apt \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*




# Setup mc \
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




# Install aitrack
COPY --chown=$USER:$USER \
    files/aitrack-linux-$AITRACK_VERSION-bin.tar.gz \
    /home/$USER/


USER root
RUN tar -xzvf ./aitrack-linux-$AITRACK_VERSION-bin.tar.gz -C /usr \
 && rm ./aitrack-linux-$AITRACK_VERSION-bin.tar.gz
USER $USER 
RUN mkdir -p /home/somebody/.local/share/aitrack




# Copy entrypoint and other scripts
COPY --chown=$USER:$USER \
     files/sysinfo.sh \
     /home/$USER/




#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["aitrack"]
