FROM ubuntu:24.04
WORKDIR /app

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
RUN curl -L -o /usr/local/bin/railway-xray "https://github.com/ryotwell/railway-xray/releases/latest/download/railway-xray-linux-amd64"
RUN chmod +x /usr/local/bin/railway-xray

EXPOSE 3000
CMD ["railway-xray"]
