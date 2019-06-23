#!/bin/bash

set -e

gcloud beta container clusters update reddit-cluster --update-addons=NetworkPolicy=ENABLED
gcloud beta container clusters update reddit-cluster --enable-network-policy --quiet
