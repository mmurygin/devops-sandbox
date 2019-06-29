#!/bin/bash

set -e

gcloud beta container clusters update reddit --update-addons=NetworkPolicy=ENABLED
gcloud beta container clusters update reddit --enable-network-policy --quiet
