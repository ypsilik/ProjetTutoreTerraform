# Création de la Keypair
resource "openstack_compute_keypair_v2" "my_keypair" {
  name = "my_keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTMhm9D3GHj1qnMoDoWUD0PKIQyE1Yy3gfh58ScqsGwtz6XKLBI9GPk1DbyXlWrT1LaMkfGwBAYKjyDNQncfoYEzIkBXbYt+zfsbVILBQPEkMMtYQtoYLLpruLsw0c7aETaQpcA4449tYdiD+4vf02gwmIxKTf545kCT1CVJbVV+H+CCBlWATKB3pWoKYMXEqJto3fVhXEud2SNNN87dRUr/2g1fUKHw9S3YdHtJfE3uAyuM9oKyaQSPfyQ85WijIcOfcBmSV+w3JeOKvTwApl7x1430hK8YpH4opWrUysbPhIk+G/redPCnV3+jYGrhc0mMNOw4TRhvnUW/vF6UoJ"
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

## Création de l'instance
#resource "openstack_compute_instance_v2" "vps" {
#  count = 5 
#  name = "vps-test-${(count.index)+1}"
#  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
#  flavor_id = "16"
#  key_pair = "my_keypair"
#  security_groups = ["${openstack_compute_secgroup_v2.terraform.id}"]

#  network {
#    name = "terraform"
#    uuid = "bbac9bf3-8a9d-47b9-8222-4929cb5a701"
#    fixed_ip_v4 = "192.168.0.1${(count.index)+1}"
#  }
#}

resource "openstack_compute_instance_v2" "test-network" {
  name = "test-network"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "my_keypair"
  security_groups = ["${openstack_compute_secgroup_v2.terraform.id}"]
  floating_ip = "84.39.37.204"

  network {
    name = "terraform"
    uuid = "bbac9bf3-8a9d-47b9-8222-4929cb5a701"
    #fixed_ip_v4 = "192.168.0.1"
    
  }
   #network {
   # name = "public"
   # floating_ip = "84.39.37.204"
  #}
}