FROM alpine

RUN apk update && \
    apk add --no-cache \
    gcc \
    libc-dev \
    openssh \
    git
