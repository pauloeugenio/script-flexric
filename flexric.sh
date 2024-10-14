#!/bin/bash

echo "Indo para o diretório home do usuário..."
cd "$HOME" || exit

# Passo 1: Clonar o repositório do FlexRIC
echo "Clonando o repositório do FlexRIC..."
git clone https://gitlab.eurecom.fr/mosaic5g/flexric

# Passo 2: Entrar no diretório do repositório
echo "Entrando no diretório flexric..."
cd flexric || exit

# Passo 3: Mudar para o branch 'slicing-spring-of-code'
echo "Trocando para o branch slicing-spring-of-code..."
git checkout slicing-spring-of-code

# Passo 4: Criar o diretório 'build' e compilar o projeto
echo "Criando o diretório build, configurando e compilando o projeto..."
mkdir build && cd build

# Passo 5: Executar cmake e make
echo "Executando cmake e make..."
cmake -DXAPP_MULTILANGUAGE=OFF ..
make -j8

# Passo 6: Instalar o projeto
echo "Instalando o FlexRIC..."
sudo make install

# Passo 7: Finalização
echo "Script concluído com sucesso!"
