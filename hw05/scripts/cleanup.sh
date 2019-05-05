#!/bin/bash

declare -r PROJECT="$1"

if [[ ! "$PROJECT" ]]; then
    echo "Please provide project id" >&2 && exit 1
fi

echo "Deleteing vm ..."
gcloud compute instances delete reddit --quiet --project="$PROJECT"

