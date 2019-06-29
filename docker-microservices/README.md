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

1. Build Images
    ```bash
    ./scripts/build.sh
    ```

1. Run app
    ```bash
    ./scripts/run.sh
    ```

1. Cleanup
    ```bash
    ./scripts/cleanup.sh [-v]
    ```

1. Remove docker machine
    ```bash
    docker-machine rm docker-host
    ```
