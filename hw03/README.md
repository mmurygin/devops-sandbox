# Setting up bastion host with vpn server

## Getting Started
### Before
1. Install requirements
    ```bash
    pip install -r requirements.txt
    ```

1. Setup google auth vars
    ```bash
    tee gce_vars/auth << EOF
    ---
    gcp_project: you-project-id
    gcp_cred_file: path-to-service-account-credentials file
    gcp_auth_kind: serviceaccount
    ...
    EOF
    ```
1. [Add your ssh key to google cloud compute metadata](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys)

### Setup bastion host
1. Setup vm with vpn server
    ```bash
    ansible-playbook setup.yml
    ```

### Cleanup
```bash
ansible-playbook cleanup.yml
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
