# DevOps projects sandbox

[![Build Status](https://travis-ci.com/muryginm/devops-sandbox.svg?token=5mNXAvsiXVJ8aCvqWa9s&branch=master)](https://travis-ci.com/muryginm/devops-sandbox)

- [Play Travis](play-travis)
    * tests which are writen in nodejs to play with travisCI and slack integration
- [Bastion Host with ansible](bastion-host)
    * Create cloud infrastructure with `ansible` `gcp module`
    * Provision vms with `ansible`
    * Inside bastion host:
        * OS: CentOS 7
        * services:
            * firewalld
            * mongod
            * pritunl
- [Web App with Ansible](gcp-ansible)
    * Create cloud infrastructure with `ansible` `gcp module`
    * Provision vms with `ansible`
    * Inside vm:
        * OS: Ubuntu 16.04
        * services:
            * mongod
            * reddit
- [Web App with Packer](gcp-packer)
    * Create cloud infrastructure with `gcloud`
    * Create vm image with `packer`
    * Inside vm:
        * OS: Ubuntu 16.04
        * services:
            * mongod
            * reddit
- [Web App with Terraform](gcp-terraform)
    * Create cloud infrastructure with `terraform`
    * Provision vm with `terraform`
    * Inside vm:
        * OS: Ubuntu 16.04
        * services:
            * mongod
            * reddit
- [Web App with Terraform and Packer](terraform-packer)
    * Create cloud infrastructure with `terraform`
    * Create vm image with `packer`
    * Inside db vm:
        * OS: Ubuntu 16.04
        * services:
            * mongod
    * Inside app vm:
        * OS: Ubuntu 16.04
        * services:
            * reddit
- [Web App with Terraform and Ansible/Packer](terraform-packer-ansible)
    * Create cloud infrastructure with `terraform`
    * [Create vm image with `packer`]
    * Provision vm with `ansible`
    * Inside db vm:
        * OS: CentOS 7
        * services:
            * firewalld
            * mongod
    * Inside app vm:
        * OS: CentOS 7
        * services:
            * firewalld
            * nginx
            * reddit
- [Docker monolith](docker-monolith)
    * Run web app inside docker container
    * Technologies:
        * terraform for creating vm
        * ansible for setting up docker
        * packer for building vm with pre-installed docker
        * docker to run containers
    * Inside vm:
        * Docker
    * Inside docker container:
        * web app
        * mongodb
- [Docker Microservices](docker-microservices)
    * Web app which consists of multiple docker containers
    * Technologies:
        * Google Cloud Platform
        * docker-machine for creating vm
        * docker-compose for running multiple microservices
        * monitoring
            * prometheus
            * node_exporter
            * cAdvisor
            * blackbox_exporter
            * mongo_exporter
- [Kubernetes Base](kube-base)
    * Base example of deploying app into kubernetes cluster
    * Technologies:
        * terraform for creating cloud resources
        * kubectl for deploying app
- [Kubernetes Helm](kube-helm)
    * The example of how to run app with helm
    * Technologies:
        * terraform for creating cloud resources
        * helm for deploying app

