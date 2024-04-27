#!/bin/sh

# Grab the docker install script, make sure you're runnig this script with sudo for this to work
curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh

# setup docker to run as a non-root user
groupadd docker
usermod -aG docker $USER
newgrp docker
systemctl enable docker.service
systemctl enable containerd.service
