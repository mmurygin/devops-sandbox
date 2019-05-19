# Getting started with terraform

## Before
1. `gcloud auth application-default login`
1. [Build base vm image](../hw05)
1. Create ssh key-pair

## Deploy app with terraform
1. Create variables file
    ```bash
    tee terraform.tfvars << EOF
    project = "your-project-id"
    public_key_path = "path-to-public-ssh-key"
    EOF
    ```
1. Setup app
    ```bash
    terraform apply
    ```

## Cleanup
    ```bash
    terraform destroy -force
    ```
