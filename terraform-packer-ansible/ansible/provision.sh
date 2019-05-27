#!/bin/bash

set -e

declare -r env="$1"

if [[ ! "$env" ]]; then
    echo "Please provide env name" >&2 && exit 1
fi

if [[ ! -e inventory/gce.ini ]]; then
    echo "Please create inventory/gce.ini and set gcloud configs" >&2 && exit 1
fi

cd ../terraform
db_ip=$(terraform output db_internal_ip)
cd ../ansible

ansible-playbook -i inventory/gce.py --extra-vars "dynamic_hosts=tag_reddit-db-${env}" db.yml
ansible-playbook -i inventory/gce.py --extra-vars "dynamic_hosts=tag_reddit-app-${env} database_url=${db_ip}:27017" app.yml
