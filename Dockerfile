FROM ubuntu:latest

LABEL version="latest"

LABEL maintainer="lafernando"

LABEL "com.github.actions.name"="GitHub Action for Bash"

LABEL "com.github.actions.description"="Executes a given Bash script"

LABEL "com.github.actions.icon"="clipboard"

LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/lafernando/github-action-bash"

LABEL "homepage"="https://github.com/lafernando/github-action-bash"

RUN apt-get install netcat-openbsd 

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
