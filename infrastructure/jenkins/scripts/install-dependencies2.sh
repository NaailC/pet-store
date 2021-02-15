#!/bin/bash
# Update and Install More Packages
sudo -su jenkins
apt update && sudo apt upgrade -y
apt install -y wget unzip curl

# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az login

# Install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
mv ./kubectl /usr/local/bin/kubectl 

# Install Docker
curl https://get.docker.com | sudo bash
groupadd docker
usermod -aG docker jenkins
newgrp docker

# Install Docker-Compose
apt update
apt install -y curl jq
version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install Terraform
apt update && sudo apt upgrade -y
apt install -y unzip wget

wget https://releases.hashicorp.com/terraform/0.14.6/terraform_0.14.6_linux_amd64.zip
unzip terraform_*_linux_*.zip

mv terraform /usr/local/bin/
rm terraform_*_linux_*.zip