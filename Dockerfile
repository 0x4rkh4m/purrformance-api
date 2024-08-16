
FROM python:3.12-slim AS builder

WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN pip install --no-cache-dir poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-dev --no-root

COPY src/ ./src/
COPY Makefile ./

FROM python:3.12-slim

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /app/src /app/src
COPY --from=builder /app/Makefile /app/Makefile

CMD ["make", "start"]
