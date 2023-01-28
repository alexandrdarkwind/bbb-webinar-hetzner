terraform {
  required_version = ">= 0.13"
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
   cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}
