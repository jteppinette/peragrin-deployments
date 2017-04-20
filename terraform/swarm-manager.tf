resource "digitalocean_droplet" "swarm-manager" {
  image = "ubuntu-16-04-x64"
  name = "swarm-manager"
  region = "${var.region}"
  size = "1gb"
  private_networking = true
  user_data = "${file("user-data.sh")}"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
  tags = ["${digitalocean_tag.environment.id}", "${digitalocean_tag.swarm.id}", "${digitalocean_tag.manager.id}"]
  lifecycle {
    ignore_changes = ["tags"]
  }
}
