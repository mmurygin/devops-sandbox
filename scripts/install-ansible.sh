#!/bin/bash

set -e
sudo apt update
sudo apt install software-properties-common -y
sudo apt-add-repository --yes ppa:ansible/ansible
sudo apt update
sudo apt install ansible -y
