# Usando a imagem oficial da Evolution API
FROM atendai/evolution-api:v2.1.1

# Instalar o cliente PostgreSQL
RUN apt-get update && apt-get install -y postgresql-client && apt-get clean

# Copiar o script de inicialização
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expondo a porta
EXPOSE 8080

# Usar o script como ponto de entrada
ENTRYPOINT ["/entrypoint.sh"]
