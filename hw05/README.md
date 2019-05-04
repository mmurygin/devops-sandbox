# Getting started with packer

## Before
1. `gcloud auth application-default login`

## Building packer images
1. Build base image with mongodb and ruby
    ```bash
    packer validate -var gcp_project=your-project-id ubuntu16.json 
    ```
