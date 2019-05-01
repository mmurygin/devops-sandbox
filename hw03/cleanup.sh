#!/bin/bash

source config.ini

vmname="$1"

if [[ ! $vmname ]]; then
    echo "Please enter vmname"
    read -r vmname
fi

echo "Deleting compute instance..."
gcloud compute instances delete --zone "$ZONE" -q "$vmname"

echo "Deleting static ip address..."
gcloud compute addresses delete --region "$REGION" -q "$vmname"
