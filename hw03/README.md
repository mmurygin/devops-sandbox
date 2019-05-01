# Setting up bastion host with vpn server

## Getting Started
### Before
1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#latest-releases-via-apt-ubuntu)
1. [Install gcloud](https://cloud.google.com/sdk/install)
1. [Add your ssh key to google cloud compute metadata](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys)
1. Authenticate with gcloud
    ```bash
    gcloud auth login
    ```

1. Set gcloud project
    ```bash
    gcloud config set project your-project-id
    ```

### Create virtual machine


### Setup bastion host with firewall and vpn server


### Cleanup
    ```bash
    ./cleanup.sh
    ```


## How-to
### Setup ssh tunnel
1. Create tunnel
    ```bash
    ssh -fNL 2222:internal-host-ip:22 bastion-ip
    ```

1. Connect to internal host via local port
    ```bash
    ssh localhost -p 2222
    ```
