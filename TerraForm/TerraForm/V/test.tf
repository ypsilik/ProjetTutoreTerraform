# Configure the OpenStack Provider
resource "openstack_blockstorage_volume_v1" "myvol" {
  name = "myvol"
  size = 1
}

resource "openstack_compute_instance_v2" "volume-attached" {
  name = "volume-attached"
  image_id = "185e1975-c9c5-4358-909e-5e329808902e"
  flavor_id = "16"
  key_pair = "JUL"
  security_groups = ["default"]

  volume {
    volume_id = "${openstack_blockstorage_volume_v1.myvol.id}"
  }
}