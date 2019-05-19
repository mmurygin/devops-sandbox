#!/bin/bash

wget https://releases.hashicorp.com/packer/1.4.1/packer_1.4.1_linux_amd64.zip -O /tmp/packer.zip
sudo unzip -o /tmp/packer.zip -d /usr/local/bin/
