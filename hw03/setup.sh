#!/bin/bash

source config.ini

vmname="$1"

if [[ ! $vmname ]]; then
    echo "Please enter vmname"
    read -r vmname
fi

echo "Creating static ip address..."
gcloud compute addresses create "$vmname" --region "$REGION"

gcloud compute instances create "$vmname" \
    --zone="$ZONE" \
    --machine-type=n1-standard-1 \
    --subnet=default \
    --tags=http-server,https-server \
    --image=rhel-7-v20190423 \
    --image-project=rhel-cloud \
    --boot-disk-size=10GB \
    --boot-disk-type=pd-standard \
    --address "$vmname"
