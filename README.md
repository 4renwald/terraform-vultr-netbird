# NetBird Self-Hosted Terraform Module

This Terraform module is designed to create a **Vultr** instance and configure the necessary DNS record in **Cloudflare**.

This will deploy NetBird with **Zitadel** as the identity provider.

The original guide on which this is based of is located here : [NetBird Self-hosting quickstart guide](https://docs.netbird.io/selfhosted/selfhosted-quickstart#quick-self-hosting-with-zitadel-id-p)

## Usage

### Setup
- Export your API keys in your environnment:

```shell
export TF_VAR_vultr_api_key='XXXXX'
export TF_VAR_cloudflare_api_token='XXXXX'
```

- Rename `terraform.tfvars.example` to `terraform.tfvars` and input your variables.

### Execute
- Run your terraform init, validate, plan, apply in order.
```shell
terraform init
terraform validate
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

### Outputs

Once completed, you will see these outptus:

```shell-session
Apply complete! Resources: 11 added, 0 changed, 0 destroyed.

Outputs:

netbird_credentials = "The NetBird admin credentials will be found inside the /home/linuxuser/netbird/setup.log file once the installation is completed."
netbird_instance_info = {
  "instance_ip" = "155.138.149.81"
  "login" = "ssh linuxuser@155.138.149.81 -i <PATH_TO_SSH_KEY>"
  "password" = "4?yR@}@U_o(T_GK3"
  "username" = "linuxuser"
}
```

### NetBird credentials

As indicated in the terraform output, the credentials for the NetBird dashboard will be found inside the instance in the `/home/linuxuser/netbird/setup.log` file.

```
linuxuser@netbird:~$ cat netbird/setup.log
...
Done!

You can access the NetBird dashboard at https://netbird.example.com
Login with the following credentials:
Username: admin@netbird.example.com
Password: FIvjywviE1PUywSyoKcUaI1tr7rHN/bisZcWfKilQ4o@
[2025-08-11T02:11:19+00:00] Setup complete