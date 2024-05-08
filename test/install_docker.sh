#!/bin/sh

# Grab the docker install script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

# setup docker to run as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
