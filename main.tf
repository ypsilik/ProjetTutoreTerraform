# Création de la Keypair
resource "openstack_compute_keypair_v2" "my_keypair" {
  name = "my_keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqeLXAOL0FH5dlum4YkfJ4eAVtF85456yivCDdn+naRSD55GIhUEAAJPDrkgyB1+XVQszqzuRs8SBw42olDbJWuoMegd72b3eKSt9ffTO5eFGSf2yFSDnsv+GP8Z9wGPCfCK0/ih6GUEKALkOxmg4chLpjkQGDlzHQEuaQraJonxATC0B0N7Azpp4FQ6rQX9imCd+xbETXnr6PekyAWPf3pQa9SjkvN8JpJWWb1Ind+7mtaszWkZPNcrC+K3DmzK4VRUx0t5Cl5EAKDJXrUKEtXCi/32zSaEZDpYQB+NkusFqp0CkdAF9/9V8+08kDYLH6up1S5ZwykRnZozp5JZzF"
}

# Secure group
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

# Réseaux 
resource "openstack_networking_network_v2" "network_1" {
  name = "resPriv2"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet_2" {
  name = "subnet_2"
  network_id = "${openstack_networking_network_v2.network_1.id}"
  cidr = "192.168.0.0/24"
  ip_version = 4
}

resource "openstack_networking_port_v2" "port_3" {
  name = "port_3"
  network_id = "${openstack_networking_network_v2.network_1.id}"
  admin_state_up = "true"
}


# Router
resource "openstack_networking_router_v2" "router_1" {
  name = "router_2"
  admin_state_up = "true"
  external_gateway = "6ea98324-0f14-49f6-97c0-885d1b8dc517"
}

resource "openstack_networking_router_interface_v2" "int_1" {
  router_id = "${openstack_networking_router_v2.router_1.id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet_2.id}"
}

resource "openstack_networking_router_route_v2" "router_route_1" {
  depends_on = ["openstack_networking_router_interface_v2.int_1"]
  router_id = "${openstack_networking_router_v2.router_1.id}"
  destination_cidr = "192.168.0.0/24"
  next_hop = "192.168.0.1"
}

# Pool ip public
resource "openstack_compute_floatingip_v2" "terraform" {
  count = 3
  pool = "public"
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
  name = "test-network"
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
