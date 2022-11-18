#!/bin/bash
#  env prepare
sudo yum update -y && sudo amazon-linux-extras install epel -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y

# install Jenkins
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins

# install docker
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker

sudo yum install git -y
# users
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker jenkins
