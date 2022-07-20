FROM python:3.8.8

ENV HOME /opt/action

WORKDIR ${HOME}
ARG USERNAME=github
USER $USERNAME
CMD ["/bin/sh"]
