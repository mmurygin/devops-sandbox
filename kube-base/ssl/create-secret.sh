#!/bin/bash

namespace="$1"
secret_name=ui-ingress

if [[ ! $(kubectl get secret -n "$namespace" "$secret_name" 2>/dev/null) ]]; then
    kubectl create secret tls "$secret_name" --key ssl/tls.key --cert ssl/tls.crt -n "$namespace"
fi
