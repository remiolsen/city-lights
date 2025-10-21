FROM python:3.12-slim-trixie
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Singularity is only tested abd found to partially work using 
# https://github.com/kaczmarj/apptainer-in-docker

ADD . /app
WORKDIR /app
RUN cd /app && uv sync && uv build
CMD ["uv", "run", "cl"]