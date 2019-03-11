FROM alpine:latest

LABEL version="latest"

LABEL maintainer="lafernando"

LABEL "com.github.actions.name"="GitHub Action for Bash Scripts"

LABEL "com.github.actions.description"="Executes the given Bash script"

LABEL "com.github.actions.icon"="box"

LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/lafernando/github-action-bash"

LABEL "homepage"="https://github.com/lafernando/github-action-bash"

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
