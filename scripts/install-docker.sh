#!/bin/bash
sudo su
yum -y update
yum -y install curl git wget mc screen htop

yum -y install docker

amazon-linux-extras install -y epel
yum -y install p7zip

curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose

mkdir -p /etc/docker
cat > /etc/docker/daemon.json <<ENDLINE
{
  "bip": "172.17.0.1/24",
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m"
  }
}
ENDLINE


systemctl enable docker
