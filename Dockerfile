# Usando a imagem oficial da Evolution API
FROM atendai/evolution-api:v2.1.1

# Expondo a porta
EXPOSE 8080

# Usar o script como ponto de entrada
ENTRYPOINT ["/entrypoint.sh"]
