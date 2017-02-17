# Création de la Keypair
resource "openstack_compute_keypair_v2" "my_keypair" {
  name = "my_keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqeLXAOL0FH5dlum4YkfJ4eAVtF85456yivCDdn+naRSD55GIhUEAAJPDrkgyB1+XVQszqzuRs8SBw42olDbJWuoMegd72b3eKSt9ffTO5eFGSf2yFSDnsv+GP8Z9wGPCfCK0/ih6GUEKALkOxmg4chLpjkQGDlzHQEuaQraJonxATC0B0N7Azpp4FQ6rQX9imCd+xbETXnr6PekyAWPf3pQa9SjkvN8JpJWWb1Ind+7mtaszWkZPNcrC+K3DmzK4VRUx0t5Cl5EAKDJXrUKEtXCi/32zSaEZDpYQB+NkusFqp0CkdAF9/9V8+08kDYLH6up1S5ZwykRnZozp5JZzF"
}

resource "openstack_compute_secgroup_v2" "terraform" {
  name        = "terraform"
  description = "security group"
  
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_floatingip_v2" "floatip_1" {
  pool = "public"
}

# Création de l'instance
resource "openstack_compute_instance_v2" "vps" {
  count = 3 
  name = "vps-test-${(count.index)+1}"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
 flavor_id = "16"
  key_pair = "my_keypair"
  security_groups = ["${openstack_compute_secgroup_v2.terraform.id}"]
  floating_ip = "${openstack_compute_floatingip_v2.floatip_1.address}"
  network {
    name = "terraform"
    uuid = "bbac9bf3-8a9d-47b9-8222-4929cb5a701"
    fixed_ip_v4 = "192.168.0.1${(count.index)+1}"
  }
}

# Création instance "passerelle ssh"
resource "openstack_compute_instance_v2" "test-network" {
  name = "test-network"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "my_keypair"
  security_groups = ["${openstack_compute_secgroup_v2.terraform.id}"]
  floating_ip = "84.39.33.117"

  network {
    name = "terraform"
    uuid = "bbac9bf3-8a9d-47b9-8222-4929cb5a701"
 #  fixed_ip_v4 = "192.168.0.1"
  }
}
