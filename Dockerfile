# Usando a imagem oficial da Evolution API
FROM atendai/evolution-api:v2.1.1

# Definindo as variáveis de ambiente do banco de dados e autenticação
ENV AUTHENTICATION_API_KEY=fLfTsOuvE6un1Gyz4nYwyQbho4OXHHqj \
    DATABASE_PROVIDER=postgresql \
    DATABASE_CONNECTION_URI=postgresql://evolution_user:evolution_password@postgres:5432/evolution_db \
    DATABASE_ENABLED=true \
    DATABASE_SAVE_DATA_INSTANCE=true \
    DATABASE_SAVE_DATA_NEW_MESSAGE=true \
    DATABASE_SAVE_MESSAGE_UPDATE=true \
    DATABASE_SAVE_DATA_CONTACTS=true \
    DATABASE_SAVE_DATA_CHATS=true \
    DATABASE_SAVE_DATA_LABELS=true \
    DATABASE_SAVE_DATA_HISTORIC=true

# Expondo a porta da aplicação
EXPOSE 8080

# Comando de inicialização com diagnóstico para verificar as variáveis de ambiente
CMD ["sh", "-c", "echo DATABASE_PROVIDER=$DATABASE_PROVIDER && echo DATABASE_CONNECTION_URI=$DATABASE_CONNECTION_URI && npm run start:prod"]
