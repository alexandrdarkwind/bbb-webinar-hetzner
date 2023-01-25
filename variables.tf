#variable "hcloud_token" {
#}
### export HCLOUD_TOKEN=

variable "location" {
  default = "hel1"
}

variable "servers" {
  type = map(string)
  default = {
    "test1.cbrbbb.com" : "cpx41"
  }
}

variable "server_image" {
  description = "Predefined Image that will be used to spin up the machines (Currently supported: ubuntu-20.04, ubuntu-18.04)"
  default     = "ubuntu-20.04"
}

variable "ssh_private_key" {
  description = "Private Key to access the machines"
  default = "./ssh_key/id_rsa"
}

variable "ssh_public_key" {
  description = "Public Key to authorized the access for the machines"
  default = "./ssh_key/id_admin737_rsa.pub"
}

variable "ssh_port" {
  default = "666"
}
