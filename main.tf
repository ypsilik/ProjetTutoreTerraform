# vps
resource "openstack_compute_instance_v2" "vps" {
  count = 3 
  name = "vps-test-${(count.index)+1}"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "${openstack_compute_keypair_v2.my_keypair.name}"
  security_groups = ["${openstack_compute_secgroup_v2.terraform.id}"]
  floating_ip = "${var.id_ip_flottante[(count.index)+1]}" # le +1 c'est parce qu'on a test vps qui utilise le 0

  network {
    name = "${openstack_networking_network_v2.network_1.name}"
    fixed_ip_v4 = "192.168.0.1${(count.index)+1}"
  }
  provisioner "local-exec" {
	connection {
		type = "ssh"
		user = "cloud"
		private_key = "${file("/home/ypsilik/.ssh/id_rsa_nopass")}"
	}
#	command = "ansible-playbook fichierAnsible.yml"
	command = "echo OK >> ok.txt"
  }
}

resource "openstack_compute_instance_v2" "test-network" {
  name = "test-network"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "${openstack_compute_keypair_v2.my_keypair.name}"
  security_groups = ["${openstack_compute_secgroup_v2.terraform.id}"]
  floating_ip = "${var.id_ip_flottante[0]}"
  network {
    name = "${openstack_networking_network_v2.network_1.name}"
    fixed_ip_v4 = "192.168.0.2"
    
  }
}
