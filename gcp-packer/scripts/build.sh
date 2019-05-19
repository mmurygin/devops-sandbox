#!/bin/bash

declare -r APP_DIR=/opt/reddit

echo "Updating packages"
apt update -y

echo "Creating service user..."
useradd -r -s '/bin/false' reddit

echo "Downloading source code..."
git clone -b monolith https://github.com/express42/reddit.git "$APP_DIR"

echo "Installing dependencies..."
cd "$APP_DIR"
bundle install

echo "Setting up permissions..."
chown -R reddit:reddit "$APP_DIR"

echo "Setup port forwaring"
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections
apt-get install -y iptables-persistent

iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 8080
iptables-save >/etc/iptables/rules.v4

echo "Enable and start reddit service"
systemctl enable --now reddit.service
