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
    gcloud container clusters get-credentials reddit-cluster
    ```

1. Create namespace
    ```bash
    kubectl apply -f namespaces
    ```

1. Create ssl key and secret
    ```
    ./ssl/generate.sh
    ./ssl/create-secret.sh
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
    kubectl apply -f reddit
    ```

## Check the result
1. Get IP (chose the IP of any node)
    ```bash
    kubectl get nodes -o wide
    ```

1. Get the port
    ```bash
    kubectl describe service ui -n dev | grep NodePort
    ```

## Cleanup
    ```bash
    terraform destroy -force
    ```
