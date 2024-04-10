#!/bin/bash

# Update the package index
sudo apt update

# Install packages to allow apt to use a repository over HTTPS
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the package index again to make sure the new Docker packages are available
sudo apt update

# Install Docker Engine
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Verify that Docker Engine is installed correctly
sudo docker --version

# Add your current user to the docker group so you can run Docker commands without sudo
sudo usermod -aG docker $USER

echo "Docker installed successfully. Please log out and log back in to use Docker without sudo."
