FROM python:3.12-slim-trixie
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ADD . /app
WORKDIR /app
RUN pip install polars-lts-cpu && uv sync && uv run cl
CMD ["uv", "run", "cl"]