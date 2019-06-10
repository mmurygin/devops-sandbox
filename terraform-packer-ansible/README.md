# Getting started with terraform

## Before
1. Install `gcloud`, `packer`, `terraform`, `ansible`

1. Add current user ssh key to gcloud compute metadata

1. `gcloud auth application-default login`


## Setup terraform
1. Create storage bucket for storing terraform state
    ```bash
    gsutil mb gs://your-state-bucket-name
    ```

1. Init terraform
    ```bash
    terraform init -backend-config="bucket=your-state-bucket-name" -backend-config="prefix=your-env"
    ```

1. Setup terraform vars
    ```bash
    cp terraform.tfvars.example terraform.tfvars
    vim terraform.tfvars
    ```

## Setup Ansible
1. Create gcloud service account and download credentials file.

1. Install ansible requirements
    ```bash
    cd ansible
    virtualenv .venv
    source .venv/bin/activate
    pip install -r requirements.txt
    ansible-galaxy install -r requirements.yml
    cd ..
    ```

1. Setup ansible vars
    ```bash
    cp ansible/inventory.gce.ini.example ansible/inventory.gce.ini
    vim ansible/inventory.gce.ini
    ```

## Create environment with app
1. Create infrastructure
    ```bash
    cd terraform
    terraform apply -var 'env=your-env'
    cd ..
    ```

1. Provision db and app
    ```bash
    cd ansible
    ./provision.sh your-env
    cd ..
    ```

## Build vm image with ansible and packer, create infra with terraform
1. Build database image
    ```bash
    packer build -var gcp_project=$(gcloud config get-value project) -var ssh_user=$(whoami) packer/mongo.json
    ```

1. Build app image
    ```bash
    packer build -var gcp_project=$(gcloud config get-value project) -var ssh_user=$(whoami) packer/reddit.json
    ```

1. Create infrastructure
    ```bash
    cd terraform
    terraform apply -var 'env=your-env' -var app_vm_image="reddit" -var db_vm_image="mongodb"
    cd ..
    ```

## Test ansible role
1. Install virtual box, vagrant
1. Install vbguest vagrant plugin
    ```bash
    vagrant plugin install vagrant-vbguest
    ```

## Cleanup
    ```bash
    cd terraform
    terraform destroy -var 'env=your-env' -force
    ```
