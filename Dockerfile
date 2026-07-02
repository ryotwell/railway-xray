FROM debian:bookworm-slim
WORKDIR /app

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
RUN curl -L -o /app/railway-xray "https://github.com/ryotwell/railway-xray/releases/latest/download/railway-xray-linux-amd64"
RUN chmod +x /app/railway-xray

EXPOSE 3000
CMD ["/app/railway-xray"]
