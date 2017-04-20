resource "digitalocean_floating_ip" "root" {
  droplet_id = "${digitalocean_droplet.swarm-manager.id}"
  region     = "${var.region}"
  depends_on = ["digitalocean_droplet.swarm-manager"]
}

resource "digitalocean_domain" "root" {
  name       = "${terraform.env == "default" ? "peragrin.com" : "${terraform.env}.peragrin.com"}"
  ip_address = "${digitalocean_floating_ip.root.ip_address}"
  depends_on = ["digitalocean_floating_ip.root"]
}

resource "digitalocean_record" "api" {
  domain = "${digitalocean_domain.root.name}"
  type   = "CNAME"
  name   = "api"
  value  = "@"
}

resource "digitalocean_record" "app" {
  domain = "${digitalocean_domain.root.name}"
  type   = "CNAME"
  name   = "app"
  value  = "@"
}

resource "digitalocean_record" "mx" {
  domain = "${digitalocean_domain.root.name}"
  type   = "MX"
  name   = "@"
  value  = "ASPMX.L.GOOGLE.COM."
  priority = "1"
}

resource "digitalocean_record" "mx-alt-one" {
  domain = "${digitalocean_domain.root.name}"
  type   = "MX"
  name   = "@"
  value  = "ALT1.ASPMX.L.GOOGLE.COM."
  priority = "5"
}

resource "digitalocean_record" "mx-alt-two" {
  domain = "${digitalocean_domain.root.name}"
  type   = "MX"
  name   = "@"
  value  = "ALT2.ASPMX.L.GOOGLE.COM."
  priority = "5"
}

resource "digitalocean_record" "mx-alt-three" {
  domain = "${digitalocean_domain.root.name}"
  type   = "MX"
  name   = "@"
  value  = "ALT3.ASPMX.L.GOOGLE.COM."
  priority = "10"
}

resource "digitalocean_record" "mx-alt-four" {
  domain = "${digitalocean_domain.root.name}"
  type   = "MX"
  name   = "@"
  value  = "ALT4.ASPMX.L.GOOGLE.COM."
  priority = "10"
}
