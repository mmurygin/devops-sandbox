#!/bin/bash

declare -r env="$1"

if [[ ! "$env" ]]; then
    echo "Please provide env name" >&2 && exit 1
fi

ansible-playbook -i inventory/gce.py --extra-vars "gce_hosts=tag_reddit-db-${env}" db.yml
ansible-playbook -i inventory/gce.py --extra-vars "gce_hosts=tag_reddit-app-${env}" app.yml
