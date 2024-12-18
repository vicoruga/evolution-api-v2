# Imagem base oficial da Evolution API
FROM atendai/evolution-api:v2.1.1

# Variável de ambiente para a chave de autenticação
ENV AUTHENTICATION_API_KEY=fLfTsOuvE6un1Gyz4nYwyQbho4OXHHqj

# Expondo a porta que a aplicação irá utilizar
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["npm", "run", "start:prod"]
