# Use uma imagem base oficial do Ubuntu
FROM ubuntu:20.04

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Instale dependências essenciais
RUN apt-get update && apt-get install -y \
    software-properties-common \
    wget \
    gnupg \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Instale Evolution
RUN apt-get update && apt-get install -y evolution evolution-ews \
    && rm -rf /var/lib/apt/lists/*

# Adicione suporte ao DBus, necessário para o Evolution
RUN apt-get install -y dbus

# Exponha a porta padrão (se necessário para o uso do Evolution)
EXPOSE 3000

# Comando para iniciar o DBus e o Evolution
CMD ["sh", "-c", "service dbus start && evolution"]
