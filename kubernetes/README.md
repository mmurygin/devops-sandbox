``# Getting started with terraform

## Before
1. `gcloud auth application-default login`
1. `terraform init`

## Deploy app
1. Setup cluster
    ```bash
    terraform apply -var project=`gcloud config get-value project`
    ```

1. Authenticate kubectl
    ```bash
    gcloud container clusters get-credentials reddit
    ```

1. Create namespace
    ```bash
    kubectl apply -f namespaces
    ```

1. Create ssl key and secret
    ```
    ./ssl/generate.sh
    ./ssl/create-secret.sh -n dev
    ```
1. Enable network isolation
    ```bash
    ./network/enable-network-policy.sh
    ```

1. Setup network isolation
    ```bash
    kubectl apply -f network/mongodb-network-policy.yml -n dev
    ```

1. Deploy app
    ```bash
    kubectl apply -f reddit -n dev
    ```

## Check the result
1. Get IP
    ```bash
    kubectl -n dev get ingress ui
    ```

1. Open browser with **https**

## Cleanup
    ```bash
    kubectl delete -f reddit -f namespaces -f network/mongodb-network-policy.yml -n dev
    terraform destroy -force
    ```
