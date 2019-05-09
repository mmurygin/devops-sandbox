# Getting started with terraform

## Before
1. Install `gcloud`, `packer`, `terraform`

1. `gcloud auth application-default login`

1. Build database image
    ```bash
    packer build -var gcp_project=project-id -var ssh_user=your-user mongo/packer.json
    ```

1. Build app image
    ```bash
    packer build -var gcp_project=project-id -var ssh_user=your-user reddit/packer.json
    ```

## Generate graph

## Deploy app with terraform
1. View resources graph
    ```bash
    terraform graph -no-color | grep -v -e 'meta.count-boundary' -e 'provider.google' | dot -Tsvg > graph.svg
    ```

1. Create variables file
    ```bash
    cp terraform.tfvars.example terraform.tfvars
    vim terraform.tfvars
    ```

1. Import default ssh rule (optional)
    ```bash
    terraform import google_compute_firewall.firewall_ssh default-allow-ssh
    ```

1. Setup app
    ```bash
    terraform apply
    ```

## Cleanup
    ```bash
    terraform destroy -force
    ```
