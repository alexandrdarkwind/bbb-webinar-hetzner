provider "hcloud" {
#  token = var.hcloud_token
}

resource "hcloud_ssh_key" "admin_webinar" {
  name       	= "admin_webinar"
  public_key 	= file(var.ssh_public_key)
}

resource "hcloud_server" "webinar" {
  for_each 	= var.servers
  name		= each.key
  server_type	= each.value
  location    	= var.location
  image       	= var.server_image
  ssh_keys 	= [
  hcloud_ssh_key.admin_webinar.id]
  firewall_ids 	= [
  hcloud_firewall.firewall.id]

 connection {
    host        = self.ipv4_address
    type        = "ssh"
    private_key = file(var.ssh_private_key)
 }

 provisioner "file" {
    source      = "scripts/ssh-port.sh"
    destination = "/root/ssh-port.sh"
 }

 provisioner "remote-exec" {
       inline 	= [
         "SSH_PORT=${var.ssh_port} bash /root/ssh-port.sh"
        ]
 }

}
