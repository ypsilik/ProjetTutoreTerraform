# Création de la Keypair
resource "openstack_compute_keypair_v2" "testKeypair" {
  name = "my-keypair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAtAMxDSFQtH5VGM4CQmgNt/x3Kse2zA0//BqNj6aKZLBdxQdd0yuqkMwvNWFi47dESRWRoNzukFS7dFW1VWGxJnj/hkZJnB7pSxOG/PGLw8tcwFThjkTivk0J0cTUT5vF7dQmuUANBHMRFki/8lWmLIlKTGjHQM/KnaiwHJbUNa4PsrXNweg7fVl1zRLMXGGL+fUCgrVKqeymqoGdjRBK1NQvRAvZkgOC9YM71ZLRqiiOp2awdkEcQXCvG7F6gf98y67pMEZRg0P7XK81zis/f9CD3HPTCSG67oPDGjdaap+JhQhP+KTEfZ9gmLdbENoL5ffDKIOM+68PH8Wpj1C3"
}

# Création de l'instance
resource "openstack_compute_instance_v2" "volume_test" {
  count = 2 
  name = "vps-test-${count.index}"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "my-keypair"
  security_groups = ["default"]
#  access_ip_v4 = "192.168.0.1${count.index}"

  network {
    name = "terraform"
    uuid = "bbac9bf3-8a9d-47b9-8222-4929cb5a701"
    fixed_ip_v4 = "192.168.0.1${count.index}"
  }
}
