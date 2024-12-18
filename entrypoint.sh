#!/bin/bash

# Validar se as variáveis essenciais estão disponíveis
if [ -z "$PGHOST" ] || [ -z "$PGUSER" ] || [ -z "$PGPASSWORD" ] || [ -z "$PGDATABASE" ]; then
  echo "Erro: Variáveis do PostgreSQL não configuradas."
  exit 1
fi

# Criar a string de conexão do banco de dados
export DATABASE_CONNECTION_URI="postgresql://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$PGDATABASE"

echo "Iniciando a API Evolution com a seguinte configuração:"
echo "PGHOST: $PGHOST"
echo "PGDATABASE: $PGDATABASE"
echo "PGUSER: $PGUSER"

# Iniciar a API Evolution
npm run start:prod
