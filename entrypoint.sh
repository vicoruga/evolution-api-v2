#!/bin/bash

# Validar se as variáveis essenciais estão disponíveis
if [ -z "$PGHOST" ] || [ -z "$PGUSER" ] || [ -z "$PGPASSWORD" ] || [ -z "$PGDATABASE" ]; then
  echo "Erro: Variáveis do PostgreSQL não configuradas."
  exit 1
fi

if [ -z "$REDIS_HOST" ] || [ -z "$REDIS_PORT" ]; then
  echo "Erro: Variáveis do Redis não configuradas."
  exit 1
fi

# Criar a string de conexão do banco de dados
export DATABASE_CONNECTION_URI="postgresql://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$PGDATABASE"

# Verificar conexão com o PostgreSQL
until pg_isready -h $PGHOST -p $PGPORT -U $PGUSER; do
  echo "Aguardando PostgreSQL..."
  sleep 5
done

# Verificar conexão com o Redis
REDIS_COMMAND="redis-cli -h $REDIS_HOST -p $REDIS_PORT"

if [ -n "$REDIS_PASSWORD" ]; then
  REDIS_COMMAND="$REDIS_COMMAND -a $REDIS_PASSWORD"
fi

until $REDIS_COMMAND ping | grep -q PONG; do
  echo "Aguardando Redis..."
  sleep 5
done

echo "PostgreSQL e Redis disponíveis! Iniciando a API Evolution..."

# Iniciar a API Evolution
npm run start:prod
