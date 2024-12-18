# Usando a imagem oficial da Evolution API
FROM atendai/evolution-api:v2.1.1

# Instalar o cliente PostgreSQL usando apk (gerenciador de pacotes Alpine)
RUN apk add --no-cache postgresql-client

# Copiar o script de inicialização
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expor a porta
EXPOSE 8080

# Usar o script como ponto de entrada
ENTRYPOINT ["/entrypoint.sh"]
