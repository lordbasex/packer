#!/bin/bash
sudo yum -y update
sudo yum -y install curl git wget mc screen htop
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o  /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
