# Getting started with packer

## Before
1. `gcloud auth application-default login`

## Deploy reddit app backed into vm image with packer
1. Build base image
    ```bash
    packer build -var gcp_project=your-project-id reddit-base.json
    ```

1. Build app vm
    ```bash
    packer build -var gcp_project=your-project-id reddit-full.json
    ```

1. Deploy app
    ```bash
    ./scripts/deploy.sh your-project-id
    ```

## Cleaning up
```bash
./scripts/cleanup.sh your-project-id
```
