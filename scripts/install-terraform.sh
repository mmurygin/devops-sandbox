#!/bin/bash

wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip -O /tmp/terraform.zip
sudo unzip -o /tmp/terraform.zip -d /usr/local/bin/
