#!/bin/bash

# Double check
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io

# Set up the repository
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     python3-pip \
     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"
sudo apt-get update

pip install --upgrade pip


# Install current version
sudo apt-get install -y docker-ce

# Optional AWS Client
pip3 install --upgrade awscli

# Set up permissions
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "/home/$USER/.docker" -R

sudo systemctl enable docker
