# Getting started with terraform

## Before
1. `gcloud auth application-default login`
1. [Build base vm image](../hw05)
1. Create ssh key-pair

## Generate graph
```bash
terraform graph -no-color | grep -v -e 'meta.count-boundary' -e 'provider.google' | dot -Tsvg > graph.svg
```

## Deploy app with terraform
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
