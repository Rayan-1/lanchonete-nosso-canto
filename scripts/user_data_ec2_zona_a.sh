#!/bin/bash

# Atualizar pacotes e instalar Git e Docker
sudo yum update -y
sudo yum install git -y
sudo yum install docker -y

# Adicionar ec2-user e ssm-user ao grupo Docker
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker ssm-user
id ec2-user ssm-user
sudo newgrp docker

# Ativar e iniciar o Docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

# Instalar Docker Compose (versão 2.23.3)
sudo mkdir -p /usr/local/lib/docker/cli-plugins
sudo curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Adicionar swap de 4GB para melhorar a performance
sudo dd if=/dev/zero of=/swapfile bs=128M count=32
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab

# Instalar Python 3 e pip
sudo yum install -y python3
sudo yum install -y python3-pip

# Verificar a instalação do Python e pip
python3 --version
pip3 --version

echo "[OK] Docker, Git, Python 3 e Docker Compose foram instalados com sucesso!"
