# Configure the OpenStack Provider
resource "openstack_blockstorage_volume_v1" "myvol" {
  name = "myvol"
  size = 1
}

resource "openstack_compute_instance_v2" "volume-attached" {
  name = "volume-attached"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "${openstack_compute_keypair_v2.my_keypair.id}"
  security_groups = ["${openstack_compute_secgroup_v2.terraform.id}"]

   network {
    name = "terraform"
  }


  volume {
    volume_id = "${openstack_blockstorage_volume_v1.myvol.id}"
  }
}

resource "openstack_compute_secgroup_v2" "terraform" {
  name        = "terraform"
  description = "Security group for the Terraform example instances"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_keypair_v2" "my_keypair" {
  name = "my_keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDnwewblveW+2p18OJne6xPaT9BwrLSz5TWbI0TcQdXyNy0D2rAKmF4GyPWP+eeo5j1WxnOM+ZK2h729w64EuiqR1H7HFvKLcSAOpc8+8xYJ7cVYmTTx0oZNgkzuluCjOYNIBtpEjzgwg5wMz8MSGWKuGKlto1o+Fx5h1FI2MKbP7jemElqOToC2c3Gz+IXVm3VR8LXNrPT1vo/DqUKJALCcsx4NYAFExUckHVBq21h6+jwpv+RwX1v+S/sHyl3U+soLrg061u2hIqvbf/mSlGyX1QwIbnZm30FKinPvgl+FhHjr33SI9VoZl2bvUkSNMooP5M/yQXKadH4Tp3zuP/b valentin@Valentin"
}