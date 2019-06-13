# Docker Monolith

This repo contains example of app build as a monolith inside docker continaer

## Getting Started
1. Install:
    * `docker`
    * `ansible`
    * `terraform`
    * `packer`

1. Build Docker Image
    ```bash
    docker build -t muryginm/reddit:latest src
    ```

1. Push docker image to registry
    ```bash
    docker login
    docker push muryginm/reddit:latest
    ```

1. Install ansible roles
    ```bash
    ansible-galaxy install -r infra/ansible/requirements.yml
    ```

1. Build vm with docker
    ```bash
    packer build -var gcp_project=$(gcloud config get-value project) -var ssh_user=$(whoami) infra/packer.json
    ```

## Deploy to Google Cloud
1. Go to working directory
    ```bash
    cd infra/terraform
    ```

1. Setup terraform variables
    ```bash
    cp terraform.tfvars.example terraform.tfvars
    vim terraform.tfvars
    ```

1. Provision vm in google cloud with terraform
    ```bash
    terraform init
    terraform apply -auto-approve
    ```
