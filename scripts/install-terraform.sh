#!/bin/bash

wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip -O /tmp/terraform.zip
sudo unzip -o /tmp/terraform.zip -d /usr/local/bin/

wget https://github.com/wata727/tflint/releases/download/v0.7.6/tflint_darwin_amd64.zip -O /tmp/tflint.zip
sudo unzip -o /tmp/tflint.zip -d /usr/local/bin/
