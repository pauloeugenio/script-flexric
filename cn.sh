#!/bin/bash

echo "Indo para o diretório home do usuário..."
cd "$HOME" || exit

# Passo 1: Clonar o repositório
echo "Clonando o repositório do OAI CN5G..."
git clone https://gitlab.eurecom.fr/oai/cn5g/oai-cn5g-fed

# Passo 2: Entrar no diretório do repositório
echo "Entrando no diretório oai-cn5g-fed..."
cd oai-cn5g-fed || exit

# Passo 3: Mudar para o branch 'slicing-spring-of-code'
echo "Trocando para o branch slicing-spring-of-code..."
git checkout slicing-spring-of-code

# Passo 4: Entrar no diretório docker-compose
echo "Entrando no diretório docker-compose..."
cd docker-compose || exit

# Passo 5: Subir os containers do Docker Compose usando o arquivo docker-compose-slicing-basic-nrf.yaml
echo "Iniciando o Docker Compose com o arquivo docker-compose-slicing-basic-nrf.yaml..."
docker compose -f docker-compose-slicing-basic-nrf.yaml up -d

# Passo 6: Finalização
echo "Script concluído!"
