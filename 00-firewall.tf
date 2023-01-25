resource "hcloud_firewall" "firewall" {
  name = "firewall"

  dynamic "rule" {
#List of open ports (default ssh port is 22, ssh port after setup is 666):
    for_each = ["22", "666", "80", "443"]
   content {
    direction = "in"
    protocol  = "tcp"
    port      = rule.value
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
   
   }
  }

  rule {
    direction = "in"
    protocol  = "udp"
    port      = "16384-32768"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
    description = "FreeSWITCH/HTML5 RTP"
  }
  rule {
    direction = "in"
    protocol  = "icmp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

}
