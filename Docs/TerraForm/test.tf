# Configure the OpenStack Provider
resource "openstack_blockstorage_volume_v1" "myvol" {
  name = "myvol"
  size = 5
  image_id = "<image-id>"
}

resource "openstack_compute_instance_v2" "boot-from-volume" {
  name = "bootfromvolume"
  flavor_id = "3"
  key_pair = "my_key_pair_name"
  security_groups = ["default"]

  block_device {
    uuid = "${openstack_blockstorage_volume_v1.myvol.id}"
    source_type = "volume"
    boot_index = 0
    destination_type = "volume"
    delete_on_termination = true
  }

  network {
    name = "my_network"
  }
}

resource "openstack_networking_network_v2" "network_1" {
  name = "network_1"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  name = "subnet_1"
  network_id = "${openstack_networking_network_v2.network_1.id}"
  cidr = "192.168.199.0/24"
  ip_version = 4
}

resource "openstack_compute_secgroup_v2" "secgroup_1" {
  name = "secgroup_1"
  description = "a security group"
  rule {
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
}

resource "openstack_networking_port_v2" "port_1" {
  name = "port_1"
  network_id = "${openstack_networking_network_v2.network_1.id}"
  admin_state_up = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
      "subnet_id" =  "${openstack_networking_subnet_v2.subnet_1.id}"
      "ip_address" =  "192.168.199.10"
  }
}

resource "openstack_compute_instance_v2" "instance_1" {
  name = "instance_1"
  security_groups = ["${openstack_compute_secgroup_v2.secgroup_1.name}"]

  network {
    port = "${openstack_networking_port_v2.port_1.id}"
  }
}



