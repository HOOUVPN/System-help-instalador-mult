#!/bin/bash

# Função para instalar as dependências
instalar_dependencias() {
    echo "Instalando as Dependências..."
    sleep 3

    sudo apt update
    sudo apt upgrade -y
    sudo timedatectl set-timezone America/Sao_Paulo

    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs

    npm install -g npm@
    npm install -g pm2@

    apt-get install -y git zip unzip nload snapd curl wget sudo
    sudo timedatectl set-timezone America/Sao_Paulo

    apt update && apt -y upgrade
    apt install docker-compose -y

    sudo apt update
    sudo apt install nginx -y
    sudo apt update

    sudo apt install certbot -y
    sudo apt install python3-certbot-nginx -y

    sudo apt update
}

# Função para exibir o banner
exibir_banner() {
    clear
    cat banner.sh  # Exibe o banner a partir do arquivo banner.sh
    echo ""
    echo "SYSTEM HELP INSTALADORES"
    echo "*************************"
    echo "1. Chatwoot Padrão"
    echo "   (Este processo pode demorar até 30 minutos em algumas VPS)"
    echo "2. Chatwoot via Docker"
    echo "   (Instalação rápida que pode demorar menos de 5 minutos)"
    echo "9. Sair"
    echo ""
}

# Função para instalar o Chatwoot (Padrão)
instalar_chatwoot_padrao() {
    echo "Instalando Chatwoot (Padrão) versão 3.0..."
    # Coloque o código de instalação do Chatwoot (versão 3.0) aqui
    echo "Chatwoot (Padrão) versão 3.0 instalado com sucesso!"
}

# Função para instalar o Chatwoot via Docker
instalar_chatwoot_docker() {
    echo "Instalando Chatwoot via Docker versão 3.0..."
    # Coloque o código de instalação do Chatwoot via Docker (versão 3.0) aqui
    echo "Chatwoot via Docker versão 3.0 instalado com sucesso!"
}

while true; do
    exibir_banner
    read -p "Escolha uma opção: " choice

    case $choice in
        1)
            instalar_dependencias
            instalar_chatwoot_padrao
            ;;
        2)
            instalar_dependencias
            instalar_chatwoot_docker
            ;;
        9)
            echo "Encerrando o Auto Instalador."
            sleep 2
            exit 0
            ;;
        *)
            echo "Opção inválida. Digite um número de 1 a 9."
            sleep 2
            ;;
    esac
done
