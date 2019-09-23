# Openstack VM using Terraform

### Install on Mac
```shell
brew install terraform
```

### To get the openstack env variables you can get RC file
```shell
source openrc.sh
env
```

### Relavant files
```
variables.tf  ## define variables
provider.tf   ## define openstack provider
deploy.tf     ## configuration
myvars.tfvars ## provide values
```

### Deploy
```shell
terraform init
terraform plan -var-file=myvars.tfvars
terraform apply -var-file=myvars.tfvars
terraform show -var-file=myvars.tfvars
terraform destroy -var-file=myvars.tfvars
```
