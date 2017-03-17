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
#  provisioner "local-exec" {
#	connection {
#		type = "ssh"
#		user = "cloud"
#		private_key = "${file("/home/ypsilik/.ssh/id_rsa_nopass")}"
#	}
#	command =  "echo \"[host${(count.index)+1}]\n ansible_ssh_host=${var.id_ip_flottante[(count.index)+1]}\n\" >> hosts"
#	command = "echo OK"
# 	command = "ansible-playbook --private-key=/home/ypsilik/.ssh/id_rsa_nopass -u cloud -i ${var.id_ip_flottante[(count.index)+1]}, fichierAnsible.yml"
# }
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

resource "null_resource" "ansible-provision"{
  triggers { 
    cluster_instance_ids = "${join(",", openstack_compute_instance_v2.vps.*.id)}"
  }
  count = 3
  provisioner "local-exec" {
    connection {
        type = "ssh"
        user = "cloud"
       private_key = "${file("/home/ypsilik/.ssh/id_rsa_nopass")}"
    }
    command = "sleep 5 && ansible-playbook --private-key=/home/ypsilik/.ssh/id_rsa_nopass -u cloud -i ${element(openstack_compute_instance_v2.vps.*.floating_ip, count.index)}, fichierAnsible.yml"
#    command = "ansible-playbook --private-key=/home/ypsilik/.ssh/id_rsa_nopass -U cloud -u cloud -i hosts fichierAnsible.yml"
  }
}

