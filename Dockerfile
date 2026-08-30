FROM python:3.13-slim

WORKDIR /app
COPY Villow_Lead_Engine_v0.7.0_build_20260828_02.zip /tmp/engine.zip
RUN python -m zipfile -e /tmp/engine.zip /app \
    && pip install --no-cache-dir \
       ./vendor/villow-0.1.2-py3-none-any.whl \
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
ENV DATABASE_PATH=/tmp/villow-lead-engine.db
EXPOSE 8080

CMD ["python", "-m", "scripts.run_villow_server"]
