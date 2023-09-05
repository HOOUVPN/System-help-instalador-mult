#!/bin/bash

# Função para exibir o banner
exibir_banner() {
    # Inclui o conteúdo do arquivo banner.sh
    source banner.sh
}

# Função para exibir as opções de instalação
exibir_opcoes() {
    echo "Escolha uma opção:"
    echo "1 - Instalar o Chatwoot (Docker)"
    echo "2 - Instalar o Chatwoot (Padrão)"
    echo "3 - Instalar o Typebot (Docker)"
    echo "4 - Instalar o Evolution (Docker)"
    echo "5 - Instalar o Evolution (Padrão com .env)"
    echo "6 - Sair"
}

# Loop principal
while true; do
    clear
    exibir_banner
    exibir_opcoes

    read -p "Digite o número da opção desejada: " escolha

    case $escolha in
        1)
            chmod +x chatwoot-docker.sh
            ./chatwoot-docker.sh
            ;;
        2)
            chmod +x chatwoot-padrao.sh
            ./chatwoot-padrao.sh
            ;;
        3)
            chmod +x typebot-docker.sh
            ./typebot-docker.sh
            ;;
        4)
            chmod +x evolution-docker.sh
            ./evolution-docker.sh
            ;;
        5)
            chmod +x evolution-padrao-env.sh
            ./evolution-padrao-env.sh
            ;;
        6)
            echo "Encerrando o Auto Instalador."
            sleep 2
            exit 0
            ;;
        *)
            echo "Opção inválida. Digite um número de 1 a 6."
            sleep 2
            ;;
    esac
done
