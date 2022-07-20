FROM ubuntu:20.04

RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Set the locale.
ENV LC_ALL C.UTF-8

RUN apt-get update \
  && apt-get -y install --no-install-recommends \
    build-essential \
    curl \
    gettext \
    git \
    hunspell-en-us \
    jq \
    libffi-dev \
    libfreetype6-dev \
    libjpeg-dev \
    libldap2-dev \
    libpq-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    locales \
    puppet \
    python3-dev \
    python3-pip \
    sudo

ARG USERNAME=github

RUN groupadd --gid 1001 $USERNAME \
  && useradd --uid 1001 --gid $USERNAME --shell /bin/bash --create-home $USERNAME \
  && echo "$USERNAME ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers.d/50-$USERNAME \

USER $USERNAME
CMD ["/bin/sh"]
