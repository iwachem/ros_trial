FROM osrf/ros:melodic-desktop-full

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ='Asia/Tokyo'

RUN apt-get update && \
    apt-get -y install \
      tzdata \
      locales \
      vim \
      git \
      build-essential \
      cmake \
      clang \
      gdb \
      valgrind \
      iproute2 \
      sudo \
      && \
    rm -rf /var/lib/apt/lists/* && \
    locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8

RUN curl -fOL https://github.com/cdr/code-server/releases/download/v3.5.0/code-server_3.5.0_amd64.deb && \
    sudo dpkg -i code-server_3.5.0_amd64.deb && \
    rm code-server_3.5.0_amd64.deb

ARG UID
ARG USER_NAME
RUN useradd --uid $UID --create-home --shell /bin/bash -G sudo,root $USER_NAME
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER $USER_NAME
WORKDIR /home/$USER_NAME

CMD ["bash"]
