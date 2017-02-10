# Création de la Keypair
resource "openstack_compute_keypair_v2" "my_keypair" {
  name = "my_keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDnwewblveW+2p18OJne6xPaT9BwrLSz5TWbI0TcQdXyNy0D2rAKmF4GyPWP+eeo5j1WxnOM+ZK2h729w64EuiqR1H7HFvKLcSAOpc8+8xYJ7cVYmTTx0oZNgkzuluCjOYNIBtpEjzgwg5wMz8MSGWKuGKlto1o+Fx5h1FI2MKbP7jemElqOToC2c3Gz+IXVm3VR8LXNrPT1vo/DqUKJALCcsx4NYAFExUckHVBq21h6+jwpv+RwX1v+S/sHyl3U+soLrg061u2hIqvbf/mSlGyX1QwIbnZm30FKinPvgl+FhHjr33SI9VoZl2bvUkSNMooP5M/yQXKadH4Tp3zuP/b "
}

# Création de l'instance
resource "openstack_compute_instance_v2" "volume_test" {
  count = 5 
  name = "vps-test-${count.index}"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "my_keypair"
  security_groups = ["${openstack_compute_secgroup_v2.terraform.id}"]
#  access_ip_v4 = "192.168.0.1${count.index}"

  network {
    name = "terraform"
    uuid = "bbac9bf3-8a9d-47b9-8222-4929cb5a701"
    fixed_ip_v4 = "192.168.0.1${count.index}"
  }
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