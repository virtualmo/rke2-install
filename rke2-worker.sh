#!/bin/bash
# rke2 - (Worker) Node Installation

# Variables, DO NO~T FORGET TO FILL IT
SERVER_IP="$1"
TOKEN="$2"

# Swap Off
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# Run the installer
curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE="agent" sh -

# Enable the rke2-agent service
systemctl enable rke2-agent.service

# Configure the rke2-agent service¶
mkdir -p /etc/rancher/rke2/
echo "server: https://$SERVER_IP:9345" | sudo tee /etc/rancher/rke2/config.yaml
echo "token: $TOKEN" \ >> /etc/rancher/rke2/config.yaml

echo "Starting RKE2 service, you can run \"journalctl -u rke2-agent -f\" on another terminal to follow the logs"

# Start the service
systemctl start rke2-agent.service
