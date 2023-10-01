FROM ubuntu:latest

# Install deps
RUN apt-get update && apt-get install autoconf bison build-essential curl gpg git -y

# Fetch source
RUN git clone https://github.com/ruanformigoni/bash-static.git
WORKDIR bash-static

## Compile bash-static
WORKDIR /bash-static
RUN ./build.sh linux "$(uname -m)"

# Copy static binary
RUN mkdir -p dist
RUN cp releases/bash dist/bash
