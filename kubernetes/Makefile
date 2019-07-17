project = $(shell gcloud config get-value project)
cluster = reddit

all: create-or-update-infra auth app

create-or-update-infra:
	terraform apply -var project=$(project) -var cluster=$(cluster)

app: namespace certs network-policy deploy

deploy:
	kubectl apply -f reddit -n dev

auth:
	gcloud container clusters get-credentials $(cluster)

namespace:
	kubectl apply -f namespaces

ssl/tls.key ssl/tls.crt:
	./ssl/generate.sh

certs: namespace ssl/tls.key ssl/tls.crt
	./ssl/create-secret.sh dev

network-policy:
	./network/enable-network-policy.sh $(cluster)

get-ip:
	kubectl -n dev get ingress ui

init:
	gcloud auth application-default login
	terraform init

cleanup:
	kubectl delete -f reddit -n dev
	kubectl delete -f namespaces
	terraform destroy -force
