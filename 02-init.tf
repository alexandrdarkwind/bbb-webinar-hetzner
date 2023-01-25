resource "null_resource" "setup" {
  depends_on = [
    hcloud_server.webinar
  ]

  for_each      = var.servers

  connection {
    host        = hcloud_server.webinar[each.key].ipv4_address
    type        = "ssh"
    port        = var.ssh_port
    private_key = file(var.ssh_private_key)
  }


 provisioner "file" {
    source      = "scripts/bootstrap.sh"
    destination = "/root/bootstrap.sh"
 }

 provisioner "file" {
    source      = "scripts/bbb-install.sh"
    destination = "/root/bbb-install.sh"
 }

 provisioner "remote-exec" {
       inline = [
         "BBB_DOMAIN=${each.key} bash /root/bootstrap.sh"
	]
 }

}
