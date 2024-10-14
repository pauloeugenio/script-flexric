#!/bin/bash

# Passo 1: Parar todos os containers
echo "Parando todos os containers Docker..."
docker stop $(docker ps -aq)

# Passo 2: Remover todos os containers
echo "Removendo todos os containers Docker..."
docker rm $(docker ps -aq)

# (Opcional) Passo 3: Remover todos os volumes (se necessário)
echo "Removendo todos os volumes Docker..."
docker volume prune -f

# Passo 4: Finalização
echo "Todos os containers e volumes foram removidos com sucesso!"
