provider "cloudflare" {
#  api_token 	= var.cloudflare_api_token
}

resource "cloudflare_record" "webinar_cbrbbb" {
  for_each      = var.servers
  zone_id 	= var.cloudflare_zone_id
  name    	= each.key
  value   	= hcloud_server.webinar[each.key].ipv4_address
  type    	= "A"
  proxied       = true
}
