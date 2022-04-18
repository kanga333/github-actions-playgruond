FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
  ruby python git curl

ENV DOCKER_BUILDKIT=1
RUN curl -LO https://raw.githubusercontent.com/microsoft/vscode-dev-containers/7a4ef23f4034e2f7ded0d2a306561f36677ced9d/script-library/docker-in-docker-debian.sh && \
  /bin/bash ./docker-in-docker-debian.sh && rm -f docker-in-docker-debian.sh

ENTRYPOINT ["/usr/local/share/docker-init.sh"]
VOLUME [ "/var/lib/docker" ]
CMD ["sleep", "infinity"]
