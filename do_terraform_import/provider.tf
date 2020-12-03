variable "do_token" {}

provider "digitalocean" {
    token   = "${var.do_token}"
    version = "1.9.1"
    }