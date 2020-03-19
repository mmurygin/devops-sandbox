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
        --google-tags "docker-reddit" \
        docker-host
    ```

1. Setup docker environment to work with cloud based docker
    ```bash
    eval $(docker-machine env docker-host)
    ```

1. Open app port
    ```bash
    gcloud compute firewall-rules create --target-tags docker-reddit --allow tcp:9292 allow-reddit-ui
    gcloud compute firewall-rules create --target-tags docker-reddit --allow tcp:9090 allow-reddit-prometheus
    gcloud compute firewall-rules create --target-tags docker-reddit --allow tcp:3000 allow-reddit-grafana
    ```

## Run with docker-compose
1. Login to docker hub
    ```bash
    docker login
    ```

1. Change `.env`

1. Build images
    ```bash
    make
    ```

1. Run app
    ```bash
    docker-compose up
    ```

## Check the result
1. View the UI
    ```bash
    curl $(docker-machine ip docker-host):9292
    ```

1. View the monitoring dashboard with Prometheus
    ```bash
    curl $(docker-machine ip docker-host):9090
    ```

## Cleanup
1. Remove docker machine
    ```bash
    docker-machine rm docker-host
    ```

1. Remove firewall rule
    ```bash
    gcloud compute firewall-rules delete allow-reddit-ui
    gcloud compute firewall-rules delete allow-reddit-prometheus
    gcloud compute firewall-rules delete allow-reddit-grafana
    ```
