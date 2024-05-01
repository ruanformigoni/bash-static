FROM alpine:latest

# Install deps
RUN apk update && apk add alpine-sdk gnupg git bash autoconf bison upx

# Fetch source
RUN git clone https://github.com/ruanformigoni/bash-static.git
WORKDIR bash-static

## Compile bash-static
WORKDIR /bash-static
RUN ./build.sh linux "$(uname -m)"

# Copy static binary
RUN mkdir -p dist
RUN cp releases/bash dist/bash

# Compress
RUN upx --ultra-brute --no-lzma dist/bash
