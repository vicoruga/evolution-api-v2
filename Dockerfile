# Usando a imagem oficial da Evolution API
FROM atendai/evolution-api:v2.1.1

# Definindo as variáveis de ambiente
ENV AUTHENTICATION_API_KEY=fLfTsOuvE6un1Gyz4nYwyQbho4OXHHqj \
    DATABASE_PROVIDER=postgresql \
    DATABASE_CONNECTION_URI=postgresql://postgres:YeHQXzBuUahVbpUFFoGvXtySxSCHsQoB@postgres.railway.internal:5432/railway \
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

# Comando para diagnóstico antes de iniciar a API
CMD ["sh", "-c", "env && echo DATABASE_PROVIDER=$DATABASE_PROVIDER && echo DATABASE_CONNECTION_URI=$DATABASE_CONNECTION_URI && npm run start:prod"]
