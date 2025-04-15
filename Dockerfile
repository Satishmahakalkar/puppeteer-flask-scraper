# Stage 1: Node.js scraper
FROM node:18-slim as scraper

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

RUN apt-get update && \
    apt-get install -y chromium chromium-driver fonts-liberation && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY node-scraper/package.json .
RUN npm install
COPY node-scraper/scrape.js .

ENV SCRAPE_URL=https://example.com
RUN node scrape.js

# Stage 2: Python Flask server
FROM python:3.10-slim

WORKDIR /app
COPY python-server/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY python-server/server.py .
COPY --from=scraper /app/scraped_data.json .

EXPOSE 5000

CMD ["python", "server.py"]

