FROM nginx:latest

# Instala ferramentas úteis solicitadas no projeto de forma não interativa
RUN apt-get update && apt-get install -y \
    iputils-ping \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copia a configuração de proxy
COPY nginx.conf /etc/nginx/nginx.conf
