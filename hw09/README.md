# Getting started with terraform

## Before
1. Install `gcloud`, `packer`, `terraform`, `ansible`

1. `gcloud auth application-default login`

1. Create storage bucket for storing terraform state
    ```bash
    gsutil mb gs://your-state-bucket-name
    ```

1. Init terraform
    ```bash
    terraform init -backend-config="bucket=your-state-bucket-name" -backend-config="prefix=env-name"
    ```

1. Setup terraform vars
    ```bash
    cp terraform.tfvars.example terraform.tfvars
    vim terraform.tfvars
    ```

1. Setup ansible vars
    ```bash
    cp ansible/inventory.gce.ini.example ansible/inventory.gce.ini
    vim ansible/inventory.gce.ini
    ```

## Provision with Ansible + Packer + Terraform
1. Build database image
    ```bash
    packer build -var gcp_project=$(gcloud config get-value project) -var ssh_user=$(whoami) packer/mongo.json
    ```

1. Build app image
    ```bash
    packer build -var gcp_project=$(gcloud config get-value project) -var ssh_user=$(whoami) packer/reddit.json
    ```

## Deploy app with terraform
1. Create variables file
    ```bash
    cp terraform.tfvars.example terraform.tfvars
    vim terraform.tfvars
    ```

1. Deploy app
    ```bash
    terraform apply
    ```

## Cleanup
    ```bash
    terraform destroy -force
    ```
