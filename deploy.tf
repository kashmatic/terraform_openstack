resource "openstack_networking_secgroup_v2" "my_sec_group" {
  name = "kashi-terraform-sg"
}

resource "openstack_networking_secgroup_rule_v2" "my_sec_group_ssh_edn" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "98.0.0.0/8"
  security_group_id = openstack_networking_secgroup_v2.my_sec_group.id
}

resource "openstack_networking_secgroup_rule_v2" "my_sec_group_ssh_cmn" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "10.0.0.0/8"
  security_group_id = openstack_networking_secgroup_v2.my_sec_group.id
}

resource "openstack_networking_secgroup_rule_v2" "my_sec_group_http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.my_sec_group.id
}

resource "openstack_networking_secgroup_rule_v2" "my_sec_group_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.my_sec_group.id
}

resource "openstack_compute_instance_v2" "kashi-kube-terraform" {
  ## Name of the VM
  name = "kashi-kube-terraform"

  ## ID of the image, Compute > Images > __ubuntu_image__ > ID
  image_name = var.vm_image

  ## From another VM, Compute > Instances > __vm__ > Specs > Flavor Name
  flavor_name = var.vm_flavor

  ## key pair
  key_pair = "${var.openstack_keypair}"

  ## list of security groups
  security_groups = ["default", "kashi-terraform-sg"]

  ## networks
  network {
    name = "${var.openstack_network}"
  }

  # provisioner "file" {
  #   source      = "install_nginx.sh"
  #   destination = "/tmp/install_nginx.sh"
  # }
  #
  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/install_nginx.sh",
  #     "/tmp/install_nginx.sh args",
  #   ]
  # }
}
