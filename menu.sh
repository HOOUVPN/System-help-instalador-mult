#!/bin/bash

# Função para exibir o banner
exibir_banner() {
    clear
    cat banner.sh  # Exibe o banner a partir do arquivo banner.sh
    echo ""
    echo "SYSTEM HELP INSTALADORES"
    echo "*************************"
    echo "1. Chatwoot Padrão"
    echo "   (Este processo pode demorar até 30 minutos em algumas VPS)"
    echo "2. Chatwoot em Docker"
    echo "   (Instalação rápida que pode demorar menos de 5 minutos)"
    echo "3. Evolution Padrão"
    echo "4. Evolution em Docker"
    echo "5. Typebot em Docker"
    echo "9. Sair"
    echo ""
}

# Função de instalação do Chatwoot (Padrão)
instalar_chatwoot_padrao() {
    echo "Instalando Chatwoot (Padrão) versão 3.0..."
    # Coloque o código de instalação do Chatwoot (versão 3.0) aqui
    echo "Chatwoot (Padrão) versão 3.0 instalado com sucesso!"
}

# Função de instalação do Chatwoot via Docker
instalar_chatwoot_docker() {
    echo "Instalando Chatwoot via Docker versão 3.0..."
    # Coloque o código de instalação do Chatwoot via Docker (versão 3.0) aqui
    echo "Chatwoot via Docker versão 3.0 instalado com sucesso!"
}

# Função de instalação do Evolution (Padrão)
instalar_evolution_padrao() {
    echo "Instalando Evolution (Padrão)..."
    # Coloque o código de instalação do Evolution (versão padrão) aqui
    echo "Evolution (Padrão) instalado com sucesso!"
}

# Função de instalação do Evolution via Docker
instalar_evolution_docker() {
    echo "Instalando Evolution via Docker..."
    # Coloque o código de instalação do Evolution via Docker aqui
    echo "Evolution via Docker instalado com sucesso!"
}

# Função de instalação do Typebot via Docker
instalar_typebot_docker() {
    echo "Instalando Typebot via Docker..."
    # Coloque o código de instalação do Typebot via Docker aqui
    echo "Typebot via Docker instalado com sucesso!"
}

while true; do
    exibir_banner
    read -p "Escolha uma opção: " choice

    case $choice in
        1)
            instalar_chatwoot_padrao
            ;;
        2)
            instalar_chatwoot_docker
            ;;
        3)
            instalar_evolution_padrao
            ;;
        4)
            instalar_evolution_docker
            ;;
        5)
            instalar_typebot_docker
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
