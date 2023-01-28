output "servers_id" {
  value = tomap({for k, inst in hcloud_server.webinar : k=> inst.id})
}

output "server_ips" {
  value = tomap({for k, inst in hcloud_server.webinar : k=> inst.ipv4_address})
}

output "server_name" {
  value = values(hcloud_server.webinar)[*].name
}

output "server_cloudflare_hostname" {
  value = values(cloudflare_record.webinar_cbrbbb)[*].hostname
}


output "server_cloudflare_value" {
  value = tomap({for k, inst in cloudflare_record.webinar_cbrbbb : k=> inst.value})
}

output "server_cloudflare_created_on" {
  value = tomap({for k, inst in cloudflare_record.webinar_cbrbbb : k=> inst.created_on})
}

