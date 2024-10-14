#!/bin/bash

echo "Indo para o diretório home do usuário..."
cd "$HOME" || exit

# Passo 1: Clonar o repositório do OpenAirInterface se não existir
if [ ! -d "openairinterface5g" ]; then
  echo "Clonando o repositório do OpenAirInterface..."
  git clone https://gitlab.eurecom.fr/oai/openairinterface5g
else
  echo "O repositório já existe. Entrando no diretório..."
fi

# Passo 2: Entrar no diretório do repositório
echo "Entrando no diretório openairinterface5g..."
cd openairinterface5g || exit

# Passo 3: Mudar para o branch 'slicing-spring-of-code'
echo "Trocando para o branch slicing-spring-of-code..."
git checkout slicing-spring-of-code

# Passo 4: Entrar no diretório cmake_targets
echo "Entrando no diretório cmake_targets..."
cd cmake_targets || exit

# Passo 5: Executar o comando de construção
echo "Executando o comando de construção..."
./build_oai -c -C -w SIMU --gNB --nrUE --build-e2 --ninja --cmake-opt -DASN1C_EXEC=$(which asn1c)

# Verificar se a construção foi bem-sucedida
if [ $? -ne 0 ]; then
  echo "Erro na construção do OpenAirInterface. Verifique os logs para mais detalhes."
  exit 1
fi

# Passo 6: Finalização
echo "Script concluído com sucesso!"
