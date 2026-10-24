FROM python:3.11-slim
LABEL maintainer="Mohammad Subhan Pasha - Vijayawada" 
LABEL trademark="TRIDENT AEGIS QUANTUM VAULT TM"
LABEL copyright="2026 All Rights Reserved - Patent Pending"
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends gcc && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN useradd -m -u 1001 trident && chown -R trident:trident /app
USER trident
EXPOSE 8000
HEALTHCHECK --interval=30s --timeout=3s CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/api/status')"
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "2"]
