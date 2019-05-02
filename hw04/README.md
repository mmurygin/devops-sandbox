# Deploy ruby app on GCE

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

### Create vm and deploy ruby app
1. Setup vm with vpn server
    ```bash
    ansible-playbook setup.yml
    ```
