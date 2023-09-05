#!/bin/bash

echo "Bem-vindo ao configurador automatizado do Chatwoot!"
echo "==============================================="

# Solicitar informações do usuário
read -p "Por favor, insira o seu domínio (exemplo.com): " dominio
read -p "Por favor, insira o seu email para o Certbot: " email
read -p "Por favor, insira o nome do builder: " builder
read -p "Por favor, insira a porta para rodar o Chatwoot (ex: 8081): " portabuilder

# Clonar o repositório Git
git clone https://github.com/HOOUVPN/chatwoot_docker.git

# Executar o comando docker-compose na pasta do projeto
cd chatwoot_docker
docker-compose up --build --no-start

# Navegar para o diretório chatwoot
cd chatwoot

# Criar a pasta data e entrar nela
mkdir -p data
cd data

# Criar as pastas postgres e redis dentro de data
mkdir -p postgres
mkdir -p redis

# Voltar para o diretório principal do projeto
cd ../..

# Executar os comandos restantes
#docker-compose run --rm rails bundle exec rails db:chatwoot_prepare
docker-compose up -d

# Configurar o proxy reverso no Nginx
cat > chatwoot_docker << EOL
server {
    server_name $builder;

    location / {
        proxy_pass http://127.0.0.1:$portabuilder;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOL

# Mover o arquivo de configuração para o Nginx
sudo mv chatwoot_docker /etc/nginx/sites-available/

# Criar um link simbólico
sudo ln -s /etc/nginx/sites-available/chatwoot_docker /etc/nginx/sites-enabled

# Configurar o certificado SSL com o Certbot
sudo certbot --nginx --email $email --redirect --agree-tos -d $dominio

# Reiniciar o Nginx para aplicar as configurações
sudo systemctl restart nginx

# Exibir mensagem de conclusão
echo "Chatwoot configurado com sucesso!"
.
