FROM ghcr.io/astral-sh/uv:debian-slim

ENV DEBIAN_FRONTEND=noninteractive

ADD . /usr/src/city-lights
WORKDIR /usr/src/city-lights
RUN apt-get update && \
    apt-get install -y build-essential && \
    uv run cl \
    apt-get remove -y build-essential && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
CMD ["uv", "run", "cl"]