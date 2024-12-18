# Usando a imagem oficial da Evolution API
FROM atendai/evolution-api:v2.1.1

# Expondo a porta
EXPOSE 8080

# Comando para inicializar a aplicação
CMD ["npm", "run", "start:prod"]
