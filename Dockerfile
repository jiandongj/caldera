FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends     gcc     && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
COPY app/ ./app/
COPY conf/ ./conf/
COPY data/ ./data/
COPY plugins/stockpile/ ./plugins/stockpile/
COPY server.py .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8888

CMD ["python", "server.py", "--insecure", "--no-gui"]
