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
    python3-dev \
    python3-pip \
    python3-venv \
    gpg \
    wget \
    sudo \
    systemd

RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg && \
    apt-get install apt-transport-https && \
    echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-8.x.list && \
    apt-get update && \
    apt-get install elasticsearch

ARG USERNAME=github

RUN groupadd --gid 1001 $USERNAME \
  && useradd --uid 1001 --gid $USERNAME --shell /bin/bash --create-home $USERNAME \
  && echo "$USERNAME ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers.d/50-$USERNAME \
  && apt-get clean autoclean  \
  && apt-get autoremove --yes  \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/

USER $USERNAME
CMD ["/bin/sh"]
