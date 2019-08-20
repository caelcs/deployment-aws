#!/bin/sh
sudo apt-get --assume-yes update
sudo apt-get --assume-yes install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
sudo apt-get --assume-yes update
sudo apt-get --assume-yes install docker-ce
sudo apt --assume-yes install python

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -a -G docker ubuntu

sudo systemctl start docker
sudo systemctl enable docker
