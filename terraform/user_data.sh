#!/bin/bash
# Update system
yum update -y

# Install Docker
amazon-linux-extras install docker -y
systemctl enable docker
systemctl start docker
usermod -a -G docker ec2-user

# Install Docker Compose (v2 binary)
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Clone your repo
git clone https://github.com/ankit24067/python-microservices-devops.git /home/ec2-user/app
cd /home/ec2-user/app

# Pull latest images and run containers
docker-compose pull
docker-compose up -d
