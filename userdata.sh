#!/bin/bash
sudo apt-get update -y

sudo apt-get install -y openjdk-11-jdk wget curl gnupg2 software-properties-common

#Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install -y jenkins

#Docker
sudo apt-get install -y docker.io

#Jenkins to Docker group
sudo usermod -aG docker jenkins

# Start Jenkins & Docker
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl start docker
sudo systemctl enable docker

# Restart Jenkins
sudo systemctl restart jenkins
