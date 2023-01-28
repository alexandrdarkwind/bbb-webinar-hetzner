# bbb-webinar-hetzner
BBB terraform Hetzner Cloud project


00-firewall.tf    - firewall config
01-server.tf      - main server setup
02-init.tf        - server post install
03-cloudflare.tf  - cloudflare dns config
variables.tf      - vars
version.tf        - version terraform and providers config
outputs.tf        - outputs
/scripts          - scripts post install
/ssh_key          - keys to access the new server, the path to the keys is written in variables.tf (READ - ssh_keys.md)
/certs            - SSL Certificate (READ - certs.md)
