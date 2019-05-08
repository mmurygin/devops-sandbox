#!/bin/bash

set -e

declare -r APP_DIR=/opt/reddit

echo "Updating packages..."
sudo apt-get update

echo "Creating service user..."
sudo useradd -r -s '/bin/false' reddit

echo "Downloading source code..."
sudo git clone -b monolith https://github.com/express42/reddit.git "$APP_DIR"

echo "Installing dependencies..."
cd "$APP_DIR"
sudo bundle install

echo "Setting up permissions..."
sudo chown -R reddit:reddit "$APP_DIR"

echo "Setup port forwaring"
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections
sudo apt-get install -y iptables-persistent

sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
sudo iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 8080
sudo iptables-save | sudo tee /etc/iptables/rules.v4

