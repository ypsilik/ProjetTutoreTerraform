# Pool ip public
resource "openstack_compute_floatingip_v2" "terraform" {
  count = 3
  pool = "${var.pool}"

}

# VPS
resource "openstack_compute_instance_v2" "vps" {
  count = 3 
  name = "vps-test-${(count.index)+1}"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "my_keypair"
  security_groups = ["${openstack_compute_secgroup_v2.terraform.id}"]
  floating_ip = "${element(openstack_compute_floatingip_v2.terraform.*.address, count.index)}"

  network {
    name = "${openstack_networking_network_v2.network_1.name}"
    fixed_ip_v4 = "192.168.0.1${(count.index)+1}"
  }
}

resource "openstack_compute_instance_v2" "test-network" {
  name = "test1-network"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "my_keypair"
  security_groups = ["${openstack_compute_secgroup_v2.terraform.id}"]
#  floating_ip = "89.39.40.107"

  network {
    name = "${openstack_networking_network_v2.network_1.name}"
    fixed_ip_v4 = "192.168.0.2"
    
  }
}
