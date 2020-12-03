provider "digitalocean" {
    token = "#digitial ocean api key"
}

resource "digitalocean_ssh_key" "default" {
  name       = "default"
  public_key = file("/root/.ssh/id_ed25519.pub")
}
 
resource "digitalocean_droplet" "web" {
    name  = "hunter"
    image = "ubuntu-18-04-x64"
    region = "nyc1"
    size   = "2gb"
    ssh_keys = [digitalocean_ssh_key.default.fingerprint]
}
 
output "ip" {
    value = "${digitalocean_droplet.web.ipv4_address}"
}