project = $(shell gcloud config get-value project)
cluster = reddit

all: infra auth app

infra:
	terraform apply -var project=$(project) -var cluster=$(cluster)

app: global certs deploy

deploy:
	kubectl apply -f reddit -n dev

auth:
	gcloud container clusters get-credentials $(cluster)

global:
	kubectl apply -f global

ssl/tls.key ssl/tls.crt:
	./ssl/generate.sh

certs: namespace ssl/tls.key ssl/tls.crt
	./ssl/create-secret.sh dev

get-ip:
	kubectl -n dev get ingress ui

helm: helm-init

helm-init:
	helm init --service-account tiller

init:
	gcloud auth application-default login
	terraform init

cleanup-cluster:
	kubectl delete -f reddit -n dev --ignore-not-found
	kubectl delete -f namespaces --ignore-not-found

cleanup-infra:
	terraform destroy -force -var project=$(project) -var cluster=$(cluster)

cleanup: cleanup-cluster cleanup-infra
