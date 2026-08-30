FROM python:3.13-slim
WORKDIR /app
COPY AutoZen_Prospect_Intelligence_v1.1.0_build_20260830_02.zip /tmp/autozen.zip
RUN python -c "import zipfile; zipfile.ZipFile('/tmp/autozen.zip').extractall('/app')" \
    && rm /tmp/autozen.zip \
    && pip install --no-cache-dir .
ENV DATA_MODE=mock
ENV APP_ENVIRONMENT=demo
ENV NARRATIVE_MODE=template
ENV DATABASE_PATH=/tmp/autozen-prospect-intelligence.db
EXPOSE 10000
CMD ["python", "-m", "scripts.run_autozen_server"]
