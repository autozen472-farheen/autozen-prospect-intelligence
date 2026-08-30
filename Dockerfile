FROM python:3.13-slim

WORKDIR /app

COPY AutoZen_Prospect_Intelligence_v1.2.0_build_20260830_03.zip /tmp/autozen.zip

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip \
    && unzip /tmp/autozen.zip -d /app \
    && rm /tmp/autozen.zip \
    && pip install --no-cache-dir . \
    && apt-get purge -y --auto-remove unzip \
    && rm -rf /var/lib/apt/lists/*

ENV PYTHONUNBUFFERED=1
ENV PORT=10000

EXPOSE 10000

CMD ["python", "-m", "scripts.run_autozen_server"]
