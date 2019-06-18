# Microservices example

## Getting Started
1. Create docker host
    ```bash
    gcloud init
    gcloud auth login
    docker-machine create \
        --driver google \
        --google-project `gcloud config get-value project` \
        --google-machine-type n1-standard-2 \
        --google-zone `gcloud config get-value compute/zone` \
        docker-host
    ```

1. Setup docker environment to work with cloud based docker
    ```bash
    eval $(docker-machine env) 
    ```

1. Login to docker hub
    ```bash
    docker login
    ```

1. Build Images
    ```bash
    ./build.sh your-docker-login
    ```
