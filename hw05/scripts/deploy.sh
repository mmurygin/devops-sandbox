#!/bin/bash

declare -r PROJECT="$1"

if [[ ! "$PROJECT" ]]; then
    echo "Please provide project id" >&2 && exit 1
fi

echo "Creating vm with app"
gcloud compute instances create reddit \
    --project="$PROJECT" \
    --zone=europe-west3-c \
    --machine-type=n1-standard-1 \
    --subnet=default \
    --network-tier=PREMIUM \
    --maintenance-policy=MIGRATE \
    --tags=http-server \
    --image-family=reddit-full \
    --image-project="$PROJECT" \
    --boot-disk-size=10GB \
    --boot-disk-type=pd-standard \
    --boot-disk-device-name=reddit
