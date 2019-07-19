project = $(shell gcloud config get-value project)
cluster = reddit

.PHONY: global-res

all: infra auth app

infra:
	terraform apply -var project=$(project) -var cluster=$(cluster) -auto-approve

app: global-res certs deploy

deploy:
	kubectl apply -f reddit -n dev

auth:
	gcloud container clusters get-credentials $(cluster)

global-res:
	kubectl apply -f global-res

ssl/tls.key ssl/tls.crt:
	./ssl/generate.sh

certs: global-res ssl/tls.key ssl/tls.crt
	./ssl/create-secret.sh dev

get-ip:
	kubectl -n dev get ingress ui

init:
	gcloud auth application-default login
	terraform init

cleanup-cluster:
	kubectl delete -f reddit -n dev --ignore-not-found
	kubectl delete -f global-res --ignore-not-found

cleanup-infra:
	terraform destroy -force -var project=$(project) -var cluster=$(cluster)

cleanup: cleanup-cluster cleanup-infra
