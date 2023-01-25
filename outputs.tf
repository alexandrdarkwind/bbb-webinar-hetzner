output "server_ips" {
  value	= "hcloud_server.webinar[each.key].ipv4_address"
}

output "server_ips_t" {
  value = "hcloud_server.webinar.*.ipv4_address"
}

output "server_ips_t1" {
  value = "hcloud_server.webinar[test.1cbrbbb.com].ipv4_address"
}

