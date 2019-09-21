###
### Openstack login details
###

variable "openstack_password" {
  description = "OS_PASSWORD"
  default     = "password"
}

variable "openstack_username" {
  description = "OS_USERNAME"
  default     = "username"
}

variable "openstack_username_domain" {
  description = "OS_USER_DOMAIN_NAME"
  default     = "domain_name"
}

## Compute > Access & Security > API access > Service > Identity > URL
variable "openstack_url" {
  description = "OS_AUTH_URL"
  default     = "https://example.openstack.com:5000/v3"
}

variable "openstack_region" {
  description = "OS_REGION_NAME"
  default     = "aregion"
}

variable "openstack_project_id" {
  description = "OS_PROJECT_ID"
  default     = "00000000000001"
}

variable "openstack_project_name" {
  description = "OS_PROJECT_NAME"
  default     = "project_name"
}

variable "openstack_keypair" {
  description = "Openstack keypair"
  default     = "mykeypair"
}

variable "openstack_network" {
  description = "Openstack EDN network"
  default     = "anetwork"
}

###
### Openstack VM details
###

variable "vm_name" {
  description = "Name of the VM"
  default     = "kashi-kube-terraform"
}

variable "vm_image" {
  description = "Name of the VM image"
  default     = "ubuntu"
}

variable "vm_flavor" {
  description = "Name of the VM flavor"
  default     = "medium"
}
