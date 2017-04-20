resource "digitalocean_droplet" "swarm-workers" {
  count = 2
  image = "ubuntu-16-04-x64"
  name = "swarm-worker-${lookup(var.itoa, count.index)}"
  region = "${var.region}"
  size = "1gb"
  private_networking = true
  user_data = "${file("user-data.sh")}"
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
  tags = ["${digitalocean_tag.environment.id}", "${digitalocean_tag.swarm.id}", "${digitalocean_tag.worker.id}"]
  lifecycle {
    ignore_changes = ["tags"]
  }
}
