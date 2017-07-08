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

resource "digitalocean_record" "minio" {
  domain = "${digitalocean_domain.root.name}"
  type   = "CNAME"
  name   = "minio"
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

resource "digitalocean_record" "DKIM" {
  domain = "${digitalocean_domain.root.name}"
  type   = "TXT"
  name   = "mandrill._domainkey"
  value  = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;"
  priority = "10"
}

resource "digitalocean_record" "SPF" {
  domain = "${digitalocean_domain.root.name}"
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:spf.mandrillapp.com ?all"
  priority = "10"
}
