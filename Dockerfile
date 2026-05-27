# Aivion Guardian™ — one-container demo
FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

# 1) Install deps first (layer caching)
COPY requirements.txt /app/requirements.txt
RUN python -m pip install --upgrade pip setuptools wheel && \
    pip install -r requirements.txt

# 2) Add the app
COPY . /app

# 3) Entrypoint script to start all 3 processes
COPY scripts/docker-entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 8502
ENV PORT=8502

# Optional: pass Slack config at runtime
# ENV SLACK_WEBHOOK_URL=
# ENV ALERT_MIN_SEVERITY=warn

CMD ["entrypoint.sh"]
