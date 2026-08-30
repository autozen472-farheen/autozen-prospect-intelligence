FROM python:3.13-slim

WORKDIR /app
COPY AutoZen_Prospect_Intelligence_v1.0.0_build_20260830_01.zip /tmp/engine.zip
RUN python -m zipfile -e /tmp/engine.zip /app \
    && pip install --no-cache-dir \
       "fastapi>=0.122,<1" \
       "httpx>=0.28,<1" \
       "openai>=2,<3" \
       "pydantic>=2.12,<3" \
       "pydantic-settings>=2.7,<3" \
       "pyyaml>=6,<7" \
       "uvicorn[standard]>=0.38,<1" \
    && rm /tmp/engine.zip

ENV DATA_MODE=mock
ENV APP_ENVIRONMENT=demo
ENV NARRATIVE_MODE=template
ENV DATABASE_PATH=/tmp/autozen-prospect-intelligence.db
EXPOSE 8080

CMD ["python", "-m", "scripts.run_autozen_server"]
