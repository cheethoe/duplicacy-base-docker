# This Dockerfile is a base image with duplicacy installed
From alpine:latest
LABEL maintainer="Michael Hsu"

# Vars
ENV DUPLICACY_BASE_URL="https://github.com/gilbertchen/duplicacy/releases/download/v2.0.9/duplicacy_linux_x64_"
ENV DUPLICACY_BASE_NAME="duplicacy_linux_x64"
ENV DUPLICACY_VERSION="2.0.9"

RUN /sbin/apk update && \
    /sbin/apk add curl

RUN curl -L -o /${DUPLICACY_BASE_NAME}_${DUPLICACY_VERSION} https://github.com/gilbertchen/duplicacy/releases/download/v${DUPLICACY_VERSION}/${DUPLICACY_BASE_NAME}_${DUPLICACY_VERSION} && \
    chmod 755 /${DUPLICACY_BASE_NAME}_${DUPLICACY_VERSION}

RUN mkdir /backup
RUN mkdir /restore

ENTRYPOINT ["/bin/sh"]
