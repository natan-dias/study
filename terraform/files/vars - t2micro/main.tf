provider "aws" {
  access_key = var.access_key #Não é necessário se o AWS Configure for realizado
  secret_key = var.secret_key #Não é necessário se o AWS Configure for realizado
  region  = var.region
}

resource "aws_instance" "web" {
    ami = var.ami
    instance_type = var.type
    #ipv6_addresses = var.ips
    tags = var.tags
}

