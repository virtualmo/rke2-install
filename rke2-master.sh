#!/bin/bash

# Run the installer
curl -sfL https://get.rke2.io | sh -

# Enable the rke2-server service
systemctl enable rke2-server.service

echo "Starting RKE2 service, you can run \"journalctl -u rke2-server -f\" on another terminal to follow the logs"

# Start the service
systemctl start rke2-server.service

# printing the token
cat /var/lib/rancher/rke2/server/node-token
