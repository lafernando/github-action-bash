FROM ubuntu:latest

LABEL version="latest"

LABEL maintainer="lafernando"

LABEL "com.github.actions.name"="GitHub Action for Bash"

LABEL "com.github.actions.description"="Executes a given Bash script"

LABEL "com.github.actions.icon"="clipboard"

LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/lafernando/github-action-bash"

LABEL "homepage"="https://github.com/lafernando/github-action-bash"

RUN apt-get update
RUN apt-get -y install netcat-openbsd
RUN apt-get -y install wget
RUN apt-get -y install socat

ENV DOCKER_CHANNEL stable
ENV DOCKER_VERSION 18.09.3
ENV dockerArch x86_64

RUN ls; \
	\
	if ! wget -O docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/${dockerArch}/docker-${DOCKER_VERSION}.tgz"; then \
		echo >&2 "error: failed to download 'docker-${DOCKER_VERSION}' from '${DOCKER_CHANNEL}' for '${dockerArch}'"; \
		exit 1; \
	fi; \
	\
	tar --extract \
		--file docker.tgz \
		--strip-components 1 \
		--directory /usr/local/bin/ \
	; \
	rm docker.tgz; \
	\
	dockerd --version; \
	docker --version

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
