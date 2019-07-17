#!/bin/bash

set -e

cluster="$1"

gcloud beta container clusters update "$cluster" --update-addons=NetworkPolicy=ENABLED
gcloud beta container clusters update "$cluster" --enable-network-policy --quiet
