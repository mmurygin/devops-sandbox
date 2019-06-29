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
    eval $(docker-machine env docker-host)
    ```

1. Open app port
    ```bash
    gcloud compute firewall-rules create --target-tags docker-machine --allow tcp:9292 allow-reddit
    ```

## Run with docker-compose
```bash
docker-compose up
```

## Check the result
    ```bash
    curl $(docker-machine ip docker-host):9292
    ```


## [Run with docker and shell scripts]

1. Build Images
    ```bash
    ./scripts/build.sh [username]
    ```

1. Run app
    ```bash
    ./scripts/run.sh [username]
    ```

## Cleanup
1. Remove docker machine
    ```bash
    docker-machine rm docker-host
    ```

1. Remove firewall rule
    ```bash
    gcloud compute firewall-rules delete allow-reddit
    ```
