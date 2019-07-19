``# Getting started with terraform

## Before
1. Install `gcloud`, `terraform`, `kubectl`
1. Init gcloud
    ```bash
    gcloud init
    ```
1. Init dependencies
    ```bash
    make init
    ```

## Deploy app
1. Deploy app
    ```bash
    make
    ```

## Check the result
1. Get IP
    ```bash
    make get-ip
    ```

1. Open browser with **https**
    * **it takes time to spin up load balancer and ingress controller, so wait for about 5 min before trying"

## Cleanup
    ```bash
    make cleanup
    ```
