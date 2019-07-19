project = $(shell gcloud config get-value project)
cluster = reddit

.PHONY: global-res

all: infra auth app

init:
	gcloud init
	gcloud auth application-default login
	terraform init

infra:
	terraform apply -var project=$(project) -var cluster=$(cluster) -auto-approve

auth:
	gcloud container clusters get-credentials $(cluster)

app: global-res certs helm

global-res:
	kubectl apply -f global-res

ssl/tls.key ssl/tls.crt:
	./ssl/generate.sh

certs: global-res ssl/tls.key ssl/tls.crt
	./ssl/create-secret.sh default

get-ip:
	kubectl get ingress reddit-ui

helm: global-res helm-init helm-wait helm-dep
	helm install -n reddit charts/reddit

helm-init:
	helm init --service-account tiller

helm-wait:
	HELMREADY=$$(kubectl --namespace kube-system get po -o json | jq '.items[] | select(.metadata.labels.app=="helm") | .status.containerStatuses[].ready // empty') ;\
	if [ -n "$$HELMREADY" ]; then exit 0; else sleep 5; echo -n "."; make helm-wait ; fi

helm-dep:
	cd charts/reddit && helm dependency update

cleanup-cluster:
	helm delete --purge reddit
	kubectl delete deployment tiller-deploy --namespace kube-system
	kubectl delete -f global-res --ignore-not-found

cleanup-infra:
	terraform destroy -force -var project=$(project) -var cluster=$(cluster)

cleanup: cleanup-cluster cleanup-infra
