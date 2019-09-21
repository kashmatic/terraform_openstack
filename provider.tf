provider "openstack" {
  user_name        = var.openstack_username
  user_domain_name = var.openstack_username_domain
  password         = var.openstack_password
  auth_url         = var.openstack_url
  region           = var.openstack_region
  tenant_id        = var.openstack_project_id
  tenant_name      = var.openstack_project_name
}
