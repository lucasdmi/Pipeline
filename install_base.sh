#!/bin/bash

# Atualizar a lista de pacotes
sudo apt update

# Instalar o Java (OpenJDK 11)
#sudo apt install -y openjdk-11-jdk

# Instalar Node.js e npm
sudo apt install -y nodejs

# Instalar o Jenkins
# Adicionar a chave do repositório

# Adicionar o repositório do Jenkins à lista de repositórios do sistema
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA
sudo apt update

# Instalar o Jenkins
sudo apt install -y jenkins

# Iniciar o Jenkins
sudo systemctl start jenkins

# Habilitar o Jenkins para iniciar na inicialização do sistema
sudo systemctl enable jenkins

# Imprimir a senha inicial do Jenkins para o login
echo "A senha inicial do Jenkins é:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
